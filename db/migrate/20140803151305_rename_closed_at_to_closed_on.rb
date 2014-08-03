class RenameClosedAtToClosedOn < ActiveRecord::Migration
  def change
    rename_column :service_requests, :closed_at, :closed_on
    change_column :service_requests, :closed_on, :date
  end
end
