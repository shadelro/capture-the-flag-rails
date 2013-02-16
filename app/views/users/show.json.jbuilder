# coding: UTF-8

json.(@user, :id, :name, :latitude, :longitude)
json.games(@user.games.map { |game| game.id.to_s })
json.flags(@user.flags.map { |flag| flag.id.to_s })
