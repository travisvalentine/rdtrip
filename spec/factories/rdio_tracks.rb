# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rdio_track do
    artist        Faker::Name.name
    title         Faker::Lorem.words(4).join(" ")
    rdio_id       "t40290"
    playlist_id   "1"
  end
end
