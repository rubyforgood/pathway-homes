class CreateEmailDigestDeliveries < ActiveRecord::Migration
  def change
    create_table :email_digest_deliveries, timestamps: false do |t|
      t.datetime :delivered_at, null: false
    end

    add_index :email_digest_deliveries, :delivered_at
  end
end
