class AddDefaultToServiceRequestStatus < ActiveRecord::Migration
  def up
    change_column :service_requests, :status, :string, :default => "open", :null => false
  end

  def down
    change_column :service_requests, :status, :string, :default => nil, :null => true
  end
end
