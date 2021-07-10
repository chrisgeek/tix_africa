class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :fee_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
