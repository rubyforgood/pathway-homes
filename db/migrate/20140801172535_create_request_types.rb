class CreateRequestTypes < ActiveRecord::Migration
  def change
    create_table :request_types do |t|
      t.string :category
      t.string :request

      t.timestamps
    end
  end
end
