class User < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :latitude
  attr_accessible :longitude

  has_many :registrations, dependent: :destroy
  has_many :games, through: :registrations

  after_initialize :init

  def init
    self.latitude = 0
    self.longitude = 0
  end
end
