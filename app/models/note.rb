class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request

  validates_presence_of :note, :user, :service_request
  
end
