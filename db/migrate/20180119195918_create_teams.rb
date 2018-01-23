class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :city
      t.string :nickname
      t.string :colors
      t.string :email
      t.timestamps
    end
  end
end
