class Mk1 < ActiveRecord::Base
  paginates_per 5
  attr_accessible :instagram_id, :instagram_link, :pic_large, :pic_med, :pic_thumb, :username, :publicado, :fullname, :visit,:tag_list
  acts_as_taggable
  def to_param
    "#{id}-#{username}"
  end
  def increment(by = 1)
    self.visit ||= 0
    self.visit += by
    self.save
  end
end
