class Commnet < ActiveRecord::Base
  attr_accessible :post_id, :usuario_id, :padre, :comentario, :publicado, :positive, :negative
  has_one :mk1

  def date
    I18n.localize(self.created_at, :format => '%d de %B, %Y' )
  end
end
