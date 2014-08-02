class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :assignee, class_name: "User", inverse_of: :assigned_requests
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type

  before_save :set_assigned_at, if: :assignee_id_changed?
  before_save :update_status
  before_save :set_closed_at

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

  private

  def set_closed_at
    if status_changed? && closed?
      self.closed_at = Time.now
    elsif status_changed? && !closed?
      self.closed_at = nil
    end
  end

  def set_assigned_at
    self.assigned_at ||= Time.now
  end

  def update_status
    if assignee_id_changed? && open?
      self.status = "assigned"
    end
  end
end
