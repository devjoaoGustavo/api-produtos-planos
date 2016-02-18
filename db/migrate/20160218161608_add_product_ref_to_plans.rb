class AddProductRefToPlans < ActiveRecord::Migration
  def change
    add_reference :plans, :product, index: true, foreign_key: true
  end
end
