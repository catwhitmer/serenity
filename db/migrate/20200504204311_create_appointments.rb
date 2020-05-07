class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :location
      t.string :date
      t.integer :time
      t.integer :user_id
      t.integer :massage_id

      t.timestamps
    end
  end
end
