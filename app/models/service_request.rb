class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :assigned_worker, class_name: "User", inverse_of: :assigned_requests
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type

  before_save :update_closed_at

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

<<<<<<< HEAD
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |request|
        csv << request.attributes.values_at(*column_names)
      end
    end
  end
  
  def assign_to_worker
    return false
  end

=======
>>>>>>> 95424dcd01391cc8c0b1187495ee8d2192fa6fa6
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
