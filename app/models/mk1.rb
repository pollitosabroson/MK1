class Mk1 < ActiveRecord::Base
  paginates_per 5
  acts_as_commentable
  acts_as_votable
  attr_accessible :instagram_id, :instagram_link, :pic_large, :pic_med, :pic_thumb, :username, :publicado, :fullname, :visit
  has_many :commnets
  def to_param
    "#{id}-#{username}"
  end
  def increment(by = 1)
    self.visit ||= 0
    self.visit += by
    self.save
  end
end
