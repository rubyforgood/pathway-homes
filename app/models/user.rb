class User < ActiveRecord::Base
  validates :role, presence: true

  has_many :created, class_name: "ServiceRequest", inverse_of: :creator

  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable

  # Upon creation, users must immediately reset their passwords when first
  # logging in
  before_create :set_password_as_expired

  # Updating the password resets `password_updated_at`
  before_save :touch_password_updated_at, :if => ->{ password.present? }

  PASSWORD_EXPIRATION_TIME = 90.days
  def password_expired?
    (password_updated_at + PASSWORD_EXPIRATION_TIME).past?
  end

  def active_for_authentication?
    super && !disabled
  end

  private
  def set_password_as_expired
    self.password_updated_at = Time.at(0) unless password_updated_at.present?
  end

  def touch_password_updated_at
    self.password_updated_at = Time.now
  end
  

end
