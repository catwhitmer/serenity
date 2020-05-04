class CreateMassages < ActiveRecord::Migration[6.0]
  def change
    create_table :massages do |t|
      t.string :category
      t.integer :length

      t.timestamps
    end
  end
end
