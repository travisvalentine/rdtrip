FactoryGirl.define do
  factory :metro do
    name                  Faker::Address.city
    name_formatted        { name.gsub(" ","%20") }
    country               Faker::Address.country
    country_formatted     { country.gsub(" ","%20") }
    latitude              Faker::Address.latitude.to_f
    longitude             Faker::Address.longitude.to_f
  end
end