#Administrators.create!(
 #  email: 'admin@admin',
 #  password: 'testtest'
#)

 (1..10).each do |i|
   user=Customer.new(email: i.to_s.to_s+"@"+i.to_s*3,password: 'hugahuga')
   user.save!
 end

  Item.create!(name: 'ケーキ',out_tax_price: '1000')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
