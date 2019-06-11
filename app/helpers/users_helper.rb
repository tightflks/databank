module UsersHelper

  def user_actions(user)
    actions = []

    if policy(user).edit?
      actions << link_to(icon_tag('pencil'), edit_user_path(user), {
        class: 'btn btn-primary btn-xs',
        title: 'Edit User'
      })
    end

    if policy(user).destroy?
      actions << link_to(icon_tag('remove'), user_path(user), {
        method: 'DELETE',
        class: 'btn btn-danger btn-xs',
        title: 'Delete User',
        data: {
          confirm: t('users.destroy.confirmation')
        }
      })
    end

    actions.join(' '.html_safe).html_safe
  end

  def sortable_users_column(name)
    title = name.titleize

    if @sort_by == name
      order = @sort_order == 'asc' ? 'desc' : 'asc'
      path = users_path(sort_by: name, sort_order: order)
      title = title_and_icon(title, "sort-#{@sort_order}")
    else
      path = users_path(sort_by: name)
    end

    link_to(title, path, class: 'block')
  end

end
