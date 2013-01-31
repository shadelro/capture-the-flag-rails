class Flag < ActiveRecord::Base
  attr_accessible :game_id
  attr_accessible :latitude_default, :longitude_default
  attr_accessible :latitude, :longitude

  belongs_to :game
  belongs_to :user

  before_create :default_values

  def default_values
    self.latitude_default ||= 0
    self.longitude_default ||= 0
    self.latitude ||= 0
    self.longitude ||= 0
  end
end
