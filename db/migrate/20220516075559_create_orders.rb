class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :custormer_id
      t.integer :send_money
      t.integer :total_money
      t.integer :cash_mean
      t.string :send_name
      t.string :postal_code
      t.string :address
      t.integer :order_status

      t.timestamps
    end
  end
end
