FactoryGirl.define do
  factory :escape do
    title         Faker::Lorem.words(4).join(" ")
    location      Faker::Lorem.words(1).join(" ")
    details       Faker::Lorem.paragraphs(2).join(" ")
    price         "$250"
    phone         Faker::PhoneNumber.phone_number
    street        Faker::Address.street_address
    city          Faker::Address.city
    state         Faker::Address.state_abbr
    zipcode       Faker::Address.zip_code
    expiration    Time.now.to_date - 7
    latitude      Faker::Address.latitude.to_f
    longitude     Faker::Address.longitude.to_f
    nearest_metro Faker::Address.city
    country       Faker::Address.country
  end
end