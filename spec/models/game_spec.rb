# coding: UTF-8

require 'spec_helper'

describe Game do

  let(:game) { Game.create(name: 'Game1') }
  let(:user) { User.create(name: 'Player1') }

  it 'has a flag' do
    expect(game.flag.class.name).to eq('Flag')
  end

  it 'is initialized with the default goal location' do
    expect(game.latitude_goal).to eq(0)
    expect(game.longitude_goal).to eq(0)
  end

  describe '#add_user!' do
    it 'adds a user' do
      game.add_user!(user)
      expect(game.users).to include(user)
      expect(Registration.find_by_game_id_and_user_id(game, user)).to_not be(nil)
    end
  end

  describe '#remove_user!' do
    it 'removes a user' do
      game.registrations.create!(user_id: user.id)
      game.remove_user!(user)
      expect(Registration.find_by_game_id_and_user_id(game, user)).to be(nil)
    end
  end

  describe '#start_game' do
    it 'starts the game' do
      game.start_game
      expect(game.in_progress?).to be(true)
    end
  end

  describe '#end_game' do
    it 'ends the game' do
      game.start_game
      game.end_game
      expect(game.in_progress?).to be(false)
    end
  end
end
