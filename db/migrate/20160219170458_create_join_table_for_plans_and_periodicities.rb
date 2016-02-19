class CreateJoinTableForPlansAndPeriodicities < ActiveRecord::Migration
  def change
  	create_table :prices do |t|
      t.belongs_to :periodicity
      t.belongs_to :plan
      t.decimal :value
    end
  end
end