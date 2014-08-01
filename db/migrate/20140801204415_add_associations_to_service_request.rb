class AddCreatorToServiceRequest < ActiveRecord::Migration
  def change
    add_reference :service_requests, :user
    add_reference :service_requests, :user
    add_reference :rservice_request, :request_type
  end
end
