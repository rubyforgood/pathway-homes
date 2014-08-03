class RemoveAssignedAtFromServiceRequests < ActiveRecord::Migration
  def change
    remove_column :service_requests, :assigned_at
  end
end
