FactoryBot.define do
  factory :position do
  	name "Kicker"
  	description "kicks the ball"
  	code "K"

		trait :invalid do
      name nil
    end

  end
end
