class AddsMaintenanceProviderToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :maintenance_provider, :integer
  end
end
