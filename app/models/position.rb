class Position < ApplicationRecord
	has_many :players_positions
  has_many :players, through: :players_positions

  validates_presence_of :name, :description, :code
end
