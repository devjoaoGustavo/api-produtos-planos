class CreatePeriodicities < ActiveRecord::Migration
  def change
    create_table :periodicities do |t|
      t.string :name
      t.integer :deadline

      t.timestamps null: false
    end
  end
end
