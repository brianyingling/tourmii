# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

u1 = User.create(:first_name=>'Brian',:last_name=>'Yingling',:email=>'brian_yingling@yahoo.com',:password=>'a', :password_confirmation=>'a',:lat=>0.0,:lng=>0.0,:address=>'2 Orston Rd., Parsippany, NJ')