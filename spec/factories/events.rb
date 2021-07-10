FactoryBot.define do
  factory :event do
    name { Faker::Game.platform }
    description { Faker::Lorem.sentence }
    start_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end_date { Faker::Date.forward(days: 23) }
    fee_status { %w[Free Paid].sample }
    association :user
  end
end
