class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :intax_price
      t.integer :puroduction_status

      t.timestamps
    end
  end
end
