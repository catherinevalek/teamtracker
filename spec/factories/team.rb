require 'rack/test'


FactoryBot.define do
  factory :team do
  	nickname "Cowboys"
  	city "Dallas"
  	colors "Blue, silver"
  	email "cowboys@dallas.com"
		logo  Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/dallas.png")

		trait :invalid do
      nickname nil
    end

  end
end
