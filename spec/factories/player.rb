FactoryBot.define do
	factory :player do
		first_name "Dez"
		last_name "Bryant"
		number 88
		association :team, factory: :team
		before(:create) do |player|
			player.positions << FactoryBot.build(:position, players: [player])
		end

		trait :invalid do
			first_name nil
		end

	end

end