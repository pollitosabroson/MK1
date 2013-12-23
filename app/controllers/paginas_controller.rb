class PaginasController < ApplicationController
  def home
    @fotos = Mk1.where(:publicado => true).order('created_at DESC').page(params[:page]).per(10)
  end

  def new_stuff
    Instagram.process_subscription(request.body.read) do |handler|
      handler.on_tag_changed do |tag, data|
        @inst = Instagram.tag_recent_media("mk1");
        @inst.each do |data|
          mkfoto = Mk1.find_or_create_by_instagram_id(
            :instagram_id => data.id,
            :instagram_link => data.link,
            :pic_thumb => data.images.thumbnail.url,
            :pic_med => data.images.low_resolution.url,
            :pic_large => data.images.standard_resolution.url,
            :fullname => data.user.full_name,
            :username => data.user.username
          )
          mkfoto.save
        end
      end
    end
    render :text => ""
  end
  def show
    @fotos = Mk1.find params[:id]
    @comment = Comment.new
    @comments = Comment.where(:commentable_id => @fotos).order('created_at DESC')
    
    #@fotos.increment
  end
  def comment
    @mk1 = Mk1.find params[:id]
    @comment = @mk1.comments.new params_comment    
    if @comment.save
      redirect_to ver_path(params[:id])
    else
      render :show
    end
  end
  def upvote
    @likes = Mk1.find(params[:id])
    @likes.liked_by @user
    redirect_to ver_path(params[:id])
  end

  def downvote
    @likes = Mk1.find(params[:id])
    @likes.downvote_from @likes
    redirect_to ver_path(params[:id])
  end
  def ranking
    #@ranking Ranking.new params_ranking
  end
  def params_comment
    params.require(:comment).permit(:comment, :title)
  end
  def params_ranking
    params.require(:ranking).permit(:post_id, :usuario_id, :raiting)
  end
end
