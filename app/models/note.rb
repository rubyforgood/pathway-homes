class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request

  validates_presence_of :note, :user, :service_request

  def print
    "Author: #{user.name} Date: #{created_at.to_date} Note: #{note}"
  end

end
