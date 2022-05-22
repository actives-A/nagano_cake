# 管理者を1人作成
Administrator.create!(
    email: 'admin@admin',
    password: 'testtest'
)

# ユーザーを10人生成
(1..10).each do |i|
    user=Customer.new(email: "test#{i+1000}"+"@"+"gmail.com",password: 'aaaaaa', first_name: "山田#{i}",last_name: "太郎#{i}",kana_first_name: "ヤマダ#{i}",
    kana_last_name: "タロウ#{i}",postal_code: "500-1111",phone_namber: "090-8888-8888",address: "東京都千代田区千代田１−１#{i}")
    user.save!
end

Genre.create(genre_name: "cake")

cakes=["長野いちごケーキ","長野ぶどうケーキ","長野りんごケーキ","長野いちご2ケーキ","長野いちご3ケーキ","長野いちご4ケーキ",]
cakes.each_with_index do |i,k|
  Item.create(genre_id:1,name: "#{i}",explanation: "test#{i}",out_tax_price: 500,sales_status: true)
end


(1..30).each do |i|
  order=Order.create(customer_id: rand(1..10),postal_code: "5000000",address: "兵庫県西宮市甲子園町１−８２",send_name: "test#{i}",total_money: i*100, order_status: rand(4),created_at: Date.current-rand(5).day)
  OrderItem.create(item_id: rand(1..5), order_id: order.id, quantity: i, intax_price: 550, puroduction_status: rand(4))
end

(1..10).each do |i|
  Address.create(name: "親戚の家",customer_id: rand(1..10),postal_code: "500-000#{i}",address: "兵庫県西宮市甲子園町１−８２-#{i}")
end


