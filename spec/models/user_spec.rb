# coding: UTF-8

require 'spec_helper'

describe User do

  let(:game) { Game.create(name: 'Game1') }
  let(:user) { User.create(name: 'Player1') }

  it 'is initialized with the default location' do
    expect(user.latitude).to eq(0)
    expect(user.longitude).to eq(0)
  end

  describe '#update_location' do
    it 'updates user latitude and longitude' do
      user.update_location(10, 20)

      expect(user.latitude).to eq(10)
      expect(user.longitude).to eq(20)
    end
  end

  describe '#pick_up_flag' do
    it 'picks up a flag' do
      user.pick_up_flag(game.flag)

      expect(user.flags).to include(game.flag)
      expect(game.flag.user).to be(user)
    end
  end

  describe '#drop_flag' do
    it 'drops a flag' do
      user.pick_up_flag(game.flag)
      user.drop_flag(game.flag)

      expect(user.flags).to_not include(game.flag)
      expect(game.flag.user).to be(nil)
    end
  end
end
