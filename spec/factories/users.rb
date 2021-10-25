FactoryBot.define do
  factory :user do 
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {"pass01"}
    password_confirmation {password}
    twitter_url           {Faker::Internet.url}
    pixiv_url             {Faker::Internet.url}
    another_url           {Faker::Internet.url}
  end
end