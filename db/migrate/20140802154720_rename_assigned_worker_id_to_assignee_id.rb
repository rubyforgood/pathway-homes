class RenameAssignedWorkerIdToAssigneeId < ActiveRecord::Migration
  def change
    rename_column :service_requests, :assigned_worker_id, :assignee_id
  end
end
