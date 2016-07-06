10.times do |num|
  Comic.create!(title: Faker::Company.buzzword, img_url:Faker::Placeholdit.image , alt_text: Faker::Hipster.sentence, post_date:Faker::Time.between(num.days.ago, Date.today, :all))
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
