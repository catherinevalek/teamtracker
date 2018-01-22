class Player < ApplicationRecord
	belongs_to :team
	has_many :players_position
  has_many :positions, through: :players_position 

  def full_name
  	"#{first_name} #{last_name}"
  end
end
