class UsersController < ApplicationController

  before_action :load_user, only: %w(show edit update destroy)

  def index
    skip_policy_scope
    authorize User

    @sort_by = params[:sort_by]
    @sort_order = params[:sort_order]
    @sort_order = 'asc' unless %w(asc desc).include?(@sort_order)

    @users = User.all
    case @sort_by
    when 'name'
      @users = @users.order(last_name: @sort_order, first_name: @sort_order)
    when 'email'
      @users = @users.order(email: @sort_order)
    when 'company'
      @users = @users.joins(:settings).merge(Users::Settings.order(company_name: @sort_order))
    else
      @sort_by = 'username'
      @users = @users.order(username: @sort_order)
    end
  end

  def show
    redirect_to action: 'edit'
  end

  def new
    @user = User.new
    @user.is_active = true
    @user.settings = Users::Settings.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    @user.settings ||= Users::Settings.new
    @user.settings.user = @user

    if @user.save
      flash[:notice] = t('users.create.success')
      redirect_to action: 'index'
    else
      flash.now[:alert] = t('users.create.failure', reason: @user.errors.full_messages.join(', '))
      render action: 'edit'
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    # don't update the password if the field was left blank
    attributes = user_params
    attributes.delete(:password) if attributes[:password].blank?

    @user.attributes = attributes
    @user.settings.user = @user
    authorize @user

    if @user.save
      flash[:notice] = t('users.update.success')
      redirect_to action: 'index'
    else
      flash.now[:alert] = t('users.update.failure', reason: @user.errors.full_messages.join(', '))
      render action: 'edit'
    end
  end

  def destroy
    authorize @user

    @user.destroy
    flash[:notice] = t('users.destroy.success')
    redirect_to action: 'index'
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username, :first_name, :last_name, :email, :password,
      :is_active, :is_superuser, :is_staff,

      settings_attributes: [
        :id,
        :company_name, :company_street, :company_city, :company_state,
        :apartment, :franchise, :land, :office, :industrial
      ]
    )
  end

end
