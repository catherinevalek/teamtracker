class CreatePlayersPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :players_positions do |t|
      t.belongs_to :player, index: true
      t.belongs_to :position, index: true
      t.timestamps
    end
  end
end
