class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :community_name
      t.string :client_name
      t.string :client_phone
      t.string :client_email
      t.string :apt_number
      t.int :status
      t.text :work_desc
      t.text :special_instructions
      t.string :pet
      t.bool :alarm
      t.string :community_street_address
      t.string :community_zip_code
      t.datetime :assigned_at
      t.datetime :closed_at

      t.timestamps
    end
  end
end
