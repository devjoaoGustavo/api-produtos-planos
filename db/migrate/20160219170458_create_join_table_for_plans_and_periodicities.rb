class CreateJoinTableForPlansAndPeriodicities < ActiveRecord::Migration
  def change
  	create_table :prices do |t|
      t.belongs_to :periodicity, index: true
      t.belongs_to :plan, index: true
      t.decimal :value
    end
  end
end
