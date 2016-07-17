10.times do |num|
  title = Faker::Company.buzzword
  Comic.create!(title: title, img_url:Faker::Placeholdit.image("600x906", "png", 'e9e9e9', '000', title), alt_text: Faker::Hipster.sentence, post_date:Faker::Time.between(num.days.ago, Date.today, :all), visible: true)
end

User.create!(name: "Tom McHenry", email: "tommchenry@gmail.com", password: "test", role: "publisher")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
