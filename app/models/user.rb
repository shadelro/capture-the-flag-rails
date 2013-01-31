class User < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :latitude
  attr_accessible :longitude

  has_many :flags
  has_many :registrations, dependent: :destroy
  has_many :games, through: :registrations

  before_create :default_values

  def default_values
    self.latitude ||= 0
    self.longitude ||= 0
  end

  def update_location(latitude, longitude)
    self.latitude = latitude
    self.longitude = longitude
    self.save
  end

  def pick_up_flag(flag)
    flag.user = self
    flag.save
    self.flags.append flag
    self.save
  end

  def drop_flag(flag)
    flag.user = nil
    flag.save
    self.flags.delete flag
    self.save
  end
end
