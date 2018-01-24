class Team < ApplicationRecord
	has_many :players 
	has_attached_file :logo, styles: {
	thumb: '25x25>'
	}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates_uniqueness_of :nickname, :email
  validates_presence_of :city, :nickname, :colors, :email, :logo
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
