class SetPasswordUpdatedAtDefaultOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :password_updated_at, :datetime, :default => "1900-01-01", :null => false
  end
end
