# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.destory_all
AdminUser.create!(:email => 'admin@gmail.com', :password => '11111111', :password_confirmation => '11111111', :role => 'admin')

Category.create!(name: '汤')
Category.create!(name: '甜品')
Category.create!(name: '主食')
Category.create!(name: '海鲜')
Category.create!(name: '牛羊肉')
Category.create!(name: '猪肉荤腥')

User.destory_all
Dict.create!(:title => "上钟时间", :category => "workhours", :value=> "90")
 
