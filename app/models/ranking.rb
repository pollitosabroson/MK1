class Ranking < ActiveRecord::Base
  attr_accessible :post_id, :usuario_id, :raiting
  has_one :comment
end
