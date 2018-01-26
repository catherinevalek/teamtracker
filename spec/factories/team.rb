require 'open-uri'

FactoryBot.define do
  factory :team do
  	nickname "Cowboys"
  	city "Dallas"
  	colors "Blue, silver"
  	email "cowboys@dallas.com"
		logo File.new("#{Rails.root}/app/assets/images/dallas.png")
  end
end
