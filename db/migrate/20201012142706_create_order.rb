class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.text :order_input

      t.timestamps
    end
  end
end
