FactoryGirl.define do
  factory :popular_song do
    artist        Faker::Name.name
    title         Faker::Lorem.words(4).join(" ")
    url           Faker::Internet.url
    metro_id      "1"
  end
end