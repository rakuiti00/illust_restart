FactoryBot.define do
  factory :traning do
    theme_text {Faker::Lorem.sentence}

    after(:build) do |traning|
      traning.image.attach(io: File.open('public/images/dummy.jpg'), filename: 'dummy.jpg')
    end
    
  end
end
