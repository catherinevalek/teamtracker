class Player < ApplicationRecord
	belongs_to :team
	has_many :players_position
  has_many :positions, through: :players_position 

  validates_presence_of :first_name, :last_name, :number, :team, :positions
  validates :number, numericality: { only_integer: true }
	# validates_uniqueness_of :number, :scope => :team_id
	
  def full_name
  	"#{first_name} #{last_name}"
  end
end
