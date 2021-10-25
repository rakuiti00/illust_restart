FactoryBot.define do
  factory :comment do
    text           {Faker::Lorem.sentence}
    good_point     {Faker::Lorem.sentence}
    advice         {Faker::Lorem.sentence}
    association    :user
    association    :post
  end
end
