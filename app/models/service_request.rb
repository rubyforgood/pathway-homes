class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :assigned_worker, class_name: "User", inverse_of: :assigned_requests
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type
  validates_associated :creator

  before_create :set_creator

  enum status: [ :open, :assigned, :in_progress, :closed ]

  validates :community_name, presence: true
  #validates :client_name, presence: true
  #validates :client_phone, presence: true
  #validates :client_email, presence: true
  validates :apt_number, presence: true
  validates :status, presence: true
  validates :work_desc, presence: true
  validates :alarm, inclusion: { in: [true, false] }
  validates :community_street_address, presence: true
  validates :community_zip_code, presence: true
  validates :pet, inclusion: { in: [true, false] }
  validates :authorized_to_enter, presence: true

  def assigned_worker=(assignee)
    if assignee.is_a?(User) && assignee.maintenance?
      self.assigned_worker = assignee
    else
      fail "Invalid assignment!"
    end
  end

  def set_creator
    # TODO: current_user is not accessible in this context -alindeman
    #self.creator = current_user
  end

end
