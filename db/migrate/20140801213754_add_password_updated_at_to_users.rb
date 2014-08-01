class AddPasswordUpdatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_updated_at, :datetime, :default => "1900-01-01", :null => false
  end
end
