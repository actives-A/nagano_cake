
# Administrators.create!(
#    email: 'admin@admin',
#    password: 'testtest'
# )

# (1..10).each do |i|
#    # user=Customer.new(email: i.to_s.to_s+"@"+i.to_s*3,password: 'hugahuga', first_name: "sss",last_name: "sss")
#    user=Customer.new(email: i.to_s.to_s+"@"+i.to_s*3,password: 'hugahuga')
#    user.save!
# end

(1..10).each do |i|
  Item.create(genre_id:1,name: "test#{i}",explanation: "test#{i}",out_tax_price: i*100,sales_status: true)
end


(1..10).each do |i|
  CartItem.create(item_id: i,customer_id: i,quantity: i)
end




# (1..2).each do |i|
  # Order.create(customer_id: i, created_at: "test#{i}",postal_code: "test#{i}",address: "test#{i}",send_name: "test#{i}",total_money: i*100, order_status: i)
# end

(1..2).each do |i|
  OrderItem.create(item_id: 1, order_id: 45, quantity: i, intax_price: i*100, puroduction_status: 0)
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#z
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
