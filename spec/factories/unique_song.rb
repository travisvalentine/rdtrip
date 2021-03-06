FactoryGirl.define do
  factory :unique_song do
    artist        Faker::Name.name
    title         Faker::Lorem.words(4).join(" ")
    url           Faker::Internet.url
    metro_id      "1"
  end
end