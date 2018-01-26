require 'open-uri'

class Team < ApplicationRecord
	# attr_reader :logo_remote_url

	has_many :players 
	has_attached_file :logo, styles: {
	thumb: '25x25>'
	}
  validates_attachment_content_type :logo, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  validates_uniqueness_of :nickname, :email
  validates_presence_of :city, :nickname, :colors, :email, :logo
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def logo_remote_url=(url_value)
    self.logo = URI.parse(url_value)
  end

end
