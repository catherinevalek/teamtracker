class PlayersPosition < ApplicationRecord
	belongs_to :player
	belongs_to :position
end
