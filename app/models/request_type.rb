class RequestType < ActiveRecord::Base
  
  validates_presence_of :category
  validates_presence_of :request
  
  validates_uniqueness_of :request, scope: :category
end
