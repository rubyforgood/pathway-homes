class RequestType < ActiveRecord::Base

  has_many :service_requests

  validates_presence_of :category
  validates_presence_of :request
  validates_uniqueness_of :request, scope: :category

  def full
    "#{category}:#{request}"
  end
end
