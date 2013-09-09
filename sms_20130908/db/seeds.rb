# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(:email => "13900000000@139.com", :mobile => "13900000000",:name=>'管理员',:role_id => 1, :password => "88888888", :password_confirmation => "88888888" )
