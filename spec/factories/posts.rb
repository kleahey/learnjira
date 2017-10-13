FactoryGirl.define do
  factory :post do
    title { Faker::Beer.name }
    body { Faker::Lorem.paragraphs(3) }
  end
end
