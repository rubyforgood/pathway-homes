class AddAuthtoenterToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :authorized_to_enter, :boolean
  end
end
