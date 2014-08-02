class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :assignee, class_name: "User", inverse_of: :assigned_requests
  belongs_to :request_type
  has_many :notes

  validates_associated :request_type

  before_save :update_status
  before_save :set_assigned_at
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
  validates :creator, presence: true
  validates :request_type, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['Request ID', 'Community Name', 'Community Street Address',
              'Community Zipcode', 'Apartment Number', 'Work Description',
              'Special Instructions', 'Alarm', 'Pets', 'Authorized to Enter',
              'Date Created', 'Date Assigned', 'Date Last Updated',
              'Date Closed', 'Status', 'Request Type', 'Request Created By',
              'Maintenance Preformed By', 'Notes']
      all.each do |request|
        csv << [request.id, request.community_name,
                request.community_street_address, request.community_zip_code,
                request.apt_number, request.work_desc, request.special_instructions,
                request.alarm, request.pet, request.authorized_to_enter,
                request.created_at, request.assigned_at, request.closed_at,
                request.closed_at, request.status, request.request_type.full,
                request.creator.name, request.assignee_name, '']
      end
    end
  end

  def assignee_name
    assignee ? assignee.name : ''
  end

  private

  def set_closed_at
    if status_changed? && closed?
      self.closed_at = Time.now
    elsif status_changed? && !closed?
      self.closed_at = nil
    end
  end

  def set_assigned_at
    if assignee_id_changed? && assigned?
      self.assigned_at = Time.now
    end
  end

  def update_status
    if assignee_id_changed? && open?
      self.status = "assigned"
    end
  end
end
