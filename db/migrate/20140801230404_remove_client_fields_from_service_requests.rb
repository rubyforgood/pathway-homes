class RemoveClientFieldsFromServiceRequests < ActiveRecord::Migration
  def up
    remove_column :service_requests, :client_name
    remove_column :service_requests, :client_phone
    remove_column :service_requests, :client_email
  end

  def down
    add_column :service_requests, :client_name, :string
    add_column :service_requests, :client_phone, :string
    add_column :service_requests, :client_email, :string
  end
end
