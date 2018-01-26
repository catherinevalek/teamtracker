
require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:position) { FactoryBot.create(:position) }

  it "is valid with a first name, last name, number, team, and positions" do
    player = Player.new(
    first_name: "Dez",
    last_name: "Bryant",
    number: 88,
    team: team
    )
    player.positions << position
    expect(player).to be_valid
  end

  it "is invalid without a first_name" do
    player = Player.new(first_name: nil)
    player.valid?
    expect(player.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last_name" do
    player = Player.new(last_name: nil)
    player.valid?
    expect(player.errors[:last_name]).to include("can't be blank")
  end

    it "is invalid without a number" do
    player = Player.new(number: nil)
    player.valid?
    expect(player.errors[:number]).to include("can't be blank")
  end

  it "is invalid without a team" do
    player = Player.new(team: nil)
    player.valid?
    expect(player.errors[:team]).to include("can't be blank")
  end

    it "is invalid without a positions" do
    player = Player.new(positions: [])
    player.valid?
    expect(player.errors[:positions]).to include("can't be blank")
  end

end



