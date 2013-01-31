class Game < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :latitude_goal
  attr_accessible :longitude_goal
  attr_accessible :in_progress

  has_one :flag, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  before_create :default_values

  def default_values
    self.latitude_goal ||= 0
    self.longitude_goal ||= 0
    self.flag ||= Flag.create
  end

  def add_user!(user)
    registrations.create!(user_id: user.id)
  end

  def remove_user!(user)
    registrations.find_by_user_id(user.id).delete
  end

  def start_game
    self.in_progress = true
    self.save
  end

  def end_game
    self.in_progress = false
    self.save
  end
end
