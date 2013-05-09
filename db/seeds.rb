# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@gmail.com', :password => '11111111', :password_confirmation => '11111111')
User.create!(:email => 'admin@admin.com', :password => '11111111', :password_confirmation => '11111111')
Dict.create!(title: "上钟时间", category: "workhours", value: "90")
 
Category.create!(name: "Art")
Category.create!(name: "Fashion")
Category.create!(name: "Gadgets")
Category.create!(name: "Hobby")
Category.create!(name: "Household")
Category.create!(name: "Learning")
Category.create!(name: "Models")
Category.create!(name: "Tools")
Category.create!(name: "Toys")
Category.create(name: "Games")
#Category.create!(name: "3D Printing")         