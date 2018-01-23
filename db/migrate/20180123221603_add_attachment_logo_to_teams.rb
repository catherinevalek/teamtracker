class AddAttachmentLogoToTeams < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teams do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :teams, :logo
  end
end
