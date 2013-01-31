require 'spec_helper'

describe Game do

  let(:game) { Game.create(name: 'Game1') }
  let(:user) { User.create(name: 'Player1') }

  it 'responds to name' do
    expect(game).to respond_to(:name)
  end

  it 'responds to flag' do
    expect(game).to respond_to(:flag)
  end

  it 'responds to users' do
    expect(game).to respond_to(:users)
  end

  it 'responds to latitude_goal' do
    expect(game).to respond_to(:latitude_goal)
  end

  it 'responds to longitude_goal' do
    expect(game).to respond_to(:longitude_goal)
  end

  it 'responds to in_progress' do
    expect(game).to respond_to(:in_progress)
  end

  describe '#add_user!' do
    it 'adds a user' do
      game.add_user!(user)
      expect(game.users).to include(user)

    end
  end

  describe '#remove_user!' do

    it 'removes a user' do
      game.add_user!(user)
      game.remove_user!(user)
      expect(game.users).to_not include(user)
   end
  end
end