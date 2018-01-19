class Position < ApplicationRecord
	has_many :players_position
  has_many :players, through: :players_position
end
