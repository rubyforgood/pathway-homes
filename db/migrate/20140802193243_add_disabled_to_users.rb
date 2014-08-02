class AddDisabledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :disabled, :boolean, :default => false, :null => false
  end
end
