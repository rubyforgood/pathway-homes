class AddModelAssociations < ActiveRecord::Migration
  def change
    add_reference :service_requests, :creator, index: true
    add_reference :service_requests, :assigned_worker, index: true
    add_reference :service_requests, :request_type, index: true
  end
end
