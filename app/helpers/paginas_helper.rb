require 'ostruct'
module PaginasHelper
	def stats(id)
	  le_post = Mk1.find id
	le_comments = Comment.where(:commentable_id => id).order('created_at DESC')
	json = {:post => le_post, :comments => le_comments }
    
    stats = OpenStruct.new(json)
    return stats
	end
end
