# coding: UTF-8

json.(@game, :name, :latitude_goal, :longitude_goal)
json.in_progress(@game.in_progress?)
json.partial! 'shared/flag', flag: @game.flag
json.users(@game.users.map { |user| user.id.to_s })
