# coding: UTF-8

json.flag_latitude(flag.latitude)
json.flag_longitude(flag.longitude)
user_id = flag.user
if user_id
  user_id = user_id.id.to_s
else
  user_id = ''
end
json.flag_held_by(user_id)
