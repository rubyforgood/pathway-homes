class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :assigned_worker, class_name: "User", inverse_of: :assigned_requests
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type

  before_save :update_closed_at

  enum status: [ :open, :assigned, :in_progress, :closed ]

  validates :community_name, presence: true
  validates :apt_number, presence: true
  validates :status, presence: true
  validates :work_desc, presence: true
  validates :alarm, inclusion: { in: [true, false] }
  validates :community_street_address, presence: true
  validates :community_zip_code, presence: true
  validates :pet, inclusion: { in: [true, false] }
  validates :authorized_to_enter, presence: true

  def assigned_worker=(assignee)
    if assignee && assignee.is_a?(User) && assignee.maintenance?
      write_attribute(:assigned_worker, assignee)
      write_attribute(:assigned_at, Time.now)
    elsif !assignee
      write_attribute(:assigned_at, Time.now) if self.assigned_at
    else
      fail "Cannot assign service requests to non-maintenance users!"
    end
  end

  private

  def status_already_closed?
    self.closed_at != nil
  end

  def update_closed_at
    if self.status == :closed && !status_already_closed?
      write_attribute(:closed_at, Time.now)
    elsif self.status != :closed && status_already_closed?
      write_attribute(:closed_at, nil)
    end
  end

end
