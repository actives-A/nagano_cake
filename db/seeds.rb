#Administrators.create!(
 #  email: 'admin@admin',
 #  password: 'testtest'
#)


# (1..10).each do |i|
#     user=Customer.new(email: "test#{i+1000}"+"@"+"gmail.com",password: 'aaaaaa', first_name: "山田#{i}",last_name: "太郎#{i}",kana_first_name: "ヤマダ#{i}",kana_last_name: "タロウ#{i}",postal_code: "500-1111",phone_namber: "090-8888-8888",address: "東京都千代田区千代田１−１#{i}")
#     # user=Customer.new(email: i.to_s.to_s+"@"+i.to_s*3,password: 'hugahuga')
#     user.save!
# end

Genre.create(genre_name: "cake")

cakes=["長野いちごケーキ","長野ぶどうケーキ","長野りんごケーキ","長野いちご2ケーキ","長野いちご3ケーキ","長野いちご4ケーキ",]
(1..10).each_with_index do |i,k|
  Item.create(genre_id:1,name: "#{i}",explanation: "test#{i}",out_tax_price: i*100,sales_status: true)
end

# (1..10).each do |i|
#   Item.create(genre_id: i,name: "test#{i}",explanation: "test#{i}",out_tax_price: i*100,sales_status: true)
# end

# (1..10).each do |i|
#   CartItem.create(item_id: i,customer_id: 1,quantity: i)
# end

# (1..10).each do |i|
#   Address.create(name: "ssss",customer_id: 1,postal_code: "ssssss",address: "1222333")
# end

# (1..2).each do |i|
  # Order.create(customer_id: i, created_at: "test#{i}",postal_code: "test#{i}",address: "test#{i}",send_name: "test#{i}",total_money: i*100, order_status: i)
# end

# (1..2).each do |i|
#   OrderItem.create(item_id: 1, order_id: 45, quantity: i, intax_price: i*100, puroduction_status: 0)
# end



#   Item.create!(name: 'ケーキ',out_tax_price: '1000')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
