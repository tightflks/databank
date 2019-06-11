class User < ApplicationRecord
  self.table_name = 'auth_user'

  has_one :settings, class_name: 'Users::Settings'

  validates_presence_of :username
  validates_presence_of :password, on: :create

  validates_uniqueness_of :username
  validates_uniqueness_of :email, allow_blank: true

  before_create :autoset_required_fields

  accepts_nested_attributes_for :settings

  delegate :apartment?, to: :settings
  delegate :franchise?, to: :settings
  delegate :land?, to: :settings
  delegate :office?, to: :settings
  delegate :industrial?, to: :settings

  def name
    "#{first_name} #{last_name}"
  end

  def company
    settings.company_name if settings
  end

  def roles
    all = []
    all << 'superuser' if is_superuser?
    all << 'staff' if is_staff?
    all
  end

  # TODO rename the encrypted password column to "encrypted_password"
  def password=(decrypted)
    encrypted = Pbkdf2PasswordHasher.hash_password(decrypted, 'NaCl', 1000)
    super(encrypted)
  end

  private

  def autoset_required_fields
    self.last_login = Time.at(0)
    self.date_joined ||= Date.today
  end

end
