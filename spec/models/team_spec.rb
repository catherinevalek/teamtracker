
require 'rails_helper'

RSpec.describe Team, type: :model do

  it "is valid with a nickname, city, email, logo, and colors" do
    team = FactoryBot.create(:team)
    expect(team).to be_valid
  end

  it "is invalid without a nickname" do
    team = Team.new(nickname: nil)
    team.valid?
    expect(team.errors[:nickname]).to include("can't be blank")
  end

  it "is invalid without a city" do
    team = Team.new(city: nil)
    team.valid?
    expect(team.errors[:city]).to include("can't be blank")
  end

    it "is invalid without a email" do
    team = Team.new(email: nil)
    team.valid?
    expect(team.errors[:email]).to include("can't be blank")
  end

    it "is invalid without a logo" do
    team = Team.new(logo: nil)
    team.valid?
    expect(team.errors[:logo]).to include("can't be blank")
  end

    it "is invalid without a colors" do
    team = Team.new(colors: nil)
    team.valid?
    expect(team.errors[:colors]).to include("can't be blank")
  end
end