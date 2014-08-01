class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.references :user, index: true
      t.references :service_request, index: true

      t.timestamps
    end
  end
end
