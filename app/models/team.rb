class Team < ApplicationRecord
	has_many :players 
	has_attached_file :logo, styles: {
	thumb: '25x25>'
	}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
