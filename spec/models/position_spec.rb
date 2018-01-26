
require 'rails_helper'

RSpec.describe Position, type: :model do

  it "is valid with a name, description, code" do
    position = FactoryBot.create(:position)
    expect(position).to be_valid
  end

  it "is invalid without a name" do
    position = Position.new(name: nil)
    position.valid?
    expect(position.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    position = Position.new(description: nil)
    position.valid?
    expect(position.errors[:description]).to include("can't be blank")
  end

    it "is invalid without a code" do
    position = Position.new(code: nil)
    position.valid?
    expect(position.errors[:code]).to include("can't be blank")
  end
end