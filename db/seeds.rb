# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#for test - by weiqi
=begin
User.create!(username:  "Weiqi Zhang",
             email: "zhangweiqi357@gmail.com",
             password:              "597dF12@@489",
             password_confirmation: "597dF12@@489",
             reg_time: "2014-02-02",
             phone: "8383838",
             activated: true,
             activated_at: Time.zone.now)


User.create!(username:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             reg_time: "2014-02-02",
             phone: "8383838",
             activated: true,
             activated_at: Time.zone.now)
=end

User.create!(username:  "Example User",
             email: "example@ucsd.edu",
             password:              "foobar",
             password_confirmation: "foobar",
             reg_time: "2015-12-02",
             phone: "8383838",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@ucsd.edu"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               reg_time: "2015-12-02",
               phone: "8383838",
               activated: true,
               activated_at: Time.zone.now)
end

Category.create!(name: "Clothes")
Category.create!(name: "Furnitures")
Category.create!(name: "Books")
Category.create!(name: "Others")




50.times do |n|
  title = Faker::Name.name
  descritpion = "aslfdaslkdfjaslfjaslkfjaslfjsa"
  Item.create!(title: title,
               description: descritpion,
               expire_time: Time.zone.now,
               is_valid: true,
               lat: 32.8866,
               lng: -117.24,
               post_date: Time.zone.now,

               user_id: n + 1,
               category_id: (n % 4) + 1,
               address: "UCSD",
               avatar: open("public/uploads/abc.jpg")
  )
end

#for test - by weiqi
Item.create!(title: "2 Chairs",
             description: "2 chairs, come to pick me",
             expire_time: Date.tomorrow,
             is_valid: true,
             lat: 32.867186,
             lng: -117.2121012,
             post_date: Time.zone.now,
             user_id: "1",
             category_id: 2,
             address: "Nobel Dr.",
             avatar: open("public/uploads/Chair.jpg")
)

Item.create!(title: "Beautiful clothes",
             description: "Clothes",
             expire_time: Date.tomorrow,
             is_valid: true,
             lat: 32.8729974,
             lng: -117.2048208,
             post_date: Time.zone.now,
             user_id: "1",
             category_id: 1,
             address: "Judicial Dr.",
             avatar: open("public/uploads/Clothes.jpg")
)


#for test - weiqi
Dib.create!(
    item_id: 51,
    user_id: 4
)
Dib.create!(
    item_id: 51,
    user_id: 5
)
Dib.create!(
    item_id: 51,
    user_id: 7
)
