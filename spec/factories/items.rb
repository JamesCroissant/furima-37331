FactoryBot.define do
  factory :item do
    title               { Faker::Lorem.sentence }
    price               { 500 }
    description         { Faker::Lorem.sentence }
    category_id         { 2 }
    condition_id        { 2 }
    delivery_charge_id  { 2 }
    shipping_area_id    { 2 }
    scheduled_day_id    { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
