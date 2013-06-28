FactoryGirl.define do

  factory :image do

    filename { Faker::Name.name }
    content_type "image/jpeg"
    base64_string { Base64.encode64 File.open("features/data/images/image1.jpg").read }

    trait :another do
      base64_string { Base64.encode64 File.open("features/data/images/image2.jpg").read }      
    end
  end
end
