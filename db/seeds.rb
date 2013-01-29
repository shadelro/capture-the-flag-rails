# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(name: 'Player1')
user2 = User.create(name: 'Player2')
user3 = User.create(name: 'Player3')
game1 = Game.create(name: 'Game1')
game2 = Game.create(name: 'Game2')
game3 = Game.create(name: 'Game3')

game1.add_user!(user1)
game1.add_user!(user3)

game2.add_user!(user2)
game2.add_user!(user3)

game3.add_user!(user1)
game3.add_user!(user2)
game3.add_user!(user3)
