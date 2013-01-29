class Game < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :latitude_goal
  attr_accessible :longitude_goal
  attr_accessible :is_active

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  after_initialize :init

  def init
    self.latitude_goal = 0
    self.longitude_goal = 0
    self.is_active = false
  end

  def add_user!(user)
    registrations.create!(user_id: user.id)
  end

  def remove_user!(user)
    registrations.find_by_user_id(user.id).delete
  end
end
