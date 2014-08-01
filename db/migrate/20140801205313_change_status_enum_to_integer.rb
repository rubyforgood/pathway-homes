class ChangeStatusEnumToInteger < ActiveRecord::Migration
  def up
    remove_column :service_requests, :status
    add_column :service_requests, :status, :integer, :default => 0, :null => false
  end

  def down
    remove_column :service_requests, :status
    add_column :service_requests, :status, :string, :default => "open", :null => false
  end
end
