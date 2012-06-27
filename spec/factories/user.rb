FactoryGirl.define do
  factory :user do
    provider 	"linkedin"
    uid 			"3wibnqX9_eq"
    name 			Faker::Name.name
    image 		Faker::Internet.url + ".jpg"
  end
end
