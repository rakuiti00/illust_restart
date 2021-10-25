FactoryBot.define do
  factory :post do
    title           {Faker::Lorem.sentence}
    description     {Faker::Lorem.sentence}
    advice_flag     {Faker::Number.between(from: 0, to: 1)}
    traning_flag    {Faker::Number.between(from: 0, to: 1)}
    association   :user
    association   :traning

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/dummy.jpg'), filename: 'dummy.jpg')
    end
  end
end
