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

  validates :alarm, inclusion: { in: [true, false] }
  validates :community_street_address, presence: true
  validates :community_zip_code, presence: true

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

  def close_service_request
    return false
  end
end
