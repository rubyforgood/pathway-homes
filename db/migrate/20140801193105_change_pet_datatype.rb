class ChangePetDatatype < ActiveRecord::Migration
  def change
    remove_column :service_requests, :pet, :string
    add_column :service_requests, :pet, :boolean
  end
end
