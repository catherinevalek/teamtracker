class Player < ApplicationRecord
	belongs_to :team
	has_many :players_position
  has_many :positions, through: :players_position 
end
