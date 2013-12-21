class Mk1 < ActiveRecord::Base
  attr_accessible :instagram_id, :instagram_link, :pic_large, :pic_med, :pic_thumb, :username, :publicado, :fullname
  def to_param
    "#{id}-#{username}"
  end
end
