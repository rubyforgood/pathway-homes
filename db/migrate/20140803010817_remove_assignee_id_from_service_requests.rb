class RemoveAssigneeIdFromServiceRequests < ActiveRecord::Migration
  def change
    remove_column :service_requests, :assignee_id
  end
end
