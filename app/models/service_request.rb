class ServiceRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type

  enum status: [ :open, :assigned, :in_progress, :closed ]

  validates :community_name, presence: true
  validates :client_name, presence: true
  validates :client_phone, presence: true
  validates :client_email, presence: true
  validates :apt_number, presence: true
  validates :status, presence: true
  validates :work_desc, presence: true

  validates :alarm, presence: true
  validates :community_street_address, presence: true
  validates :community_zip_code, presence: true

  before_validation :set_status_to_open, :on => :create

  def assign_to_worker
    return false
  end

  def close_service_request
    return false
  end

  private
  def set_status_to_open
    self.status = "open"
  end
end
