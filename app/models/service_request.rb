class ServiceRequest < ActiveRecord::Base
  belongs_to :creator, class_name: "User", inverse_of: :created
  belongs_to :request_type
  has_many :notes

  before_save :remove_closed_on
  after_update :notify_requestor_if_closed

  enum status: [ :open, :assigned, :in_progress, :closed ]
  enum maintenance_provider: [ :internal, :external ]

  validates :community_name, presence: true
  validates :apt_number, presence: true
  validates :status, presence: true
  validates :work_desc, presence: true
  validates :alarm, inclusion: { in: [true, false] }
  validates :community_street_address, presence: true
  validates :community_zip_code, presence: true
  validates :pet, inclusion: { in: [true, false] }
  validates :authorized_to_enter, inclusion: { in: [true, false] }
  validates :creator, presence: true
  validates :request_type, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['Request ID', 'Community Name', 'Community Street Address',
              'Community Zipcode', 'Apartment Number', 'Work Description',
              'Special Instructions', 'Alarm', 'Pets', 'Authorized to Enter',
              'Date Created', 'Date Last Updated',
              'Date Closed', 'Status', 'Request Type', 'Request Created By',
              'Notes']
      all.each do |request|
        csv << [request.id, request.community_name,
                request.community_street_address, request.community_zip_code,
                request.apt_number, request.work_desc, request.special_instructions,
                request.alarm, request.pet, request.authorized_to_enter,
                request.created_at.to_date, request.closed_on,
                request.closed_on, request.status, request.request_type.full,
                request.creator.name, request.note_export]
      end
    end
  end

  def creator_name
    creator && creator.name
  end

  def creator_email
    creator && creator.email
  end

  def full_request_type
    request_type && request_type.full
  end

  def note_export
    notes.map(&:print).join(" | ")
  end

  private

  def remove_closed_on
    unless closed?
      self.closed_on = nil
    end
  end

  def notify_requestor_if_closed
    if status_changed? && closed?
      # Reenable when email service is added to the heroku account
      # ServiceRequestMailer.creator_update_on_completion(self).deliver
    end
  end
end
