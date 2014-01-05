class PaginasController < ApplicationController
  def home
    @fotos = Mk1.where(:publicado => true).order('created_at DESC').page(params[:page]).per(10)
  end

  def new_stuff
    Instagram.process_subscription(request.body.read) do |handler|
      handler.on_tag_changed do |tag, data|
        @inst = Instagram.tag_recent_media("gti");
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
    @ranking = Ranking.new
    @fotos.increment
  end
  def comment
    @mk1 = Mk1.find params[:id]
    @comment = @mk1.comments.new params_comment
    @comment.user_id =  current_user.id
    if @comment.save
      redirect_to show_path(params[:id])
    else
      render :show
    end
  end
  def ranking
    @ranking = Ranking.new
    @ranking.raiting = params[:commit].to_i.inspect
    @ranking.post_id = params[:id]
    if @ranking.save
      redirect_to show_path(params[:id])
    else
      render :show
    end
  end
  def visit
    @visit =Mk1.order("visit DESC").last(5)
  end
  def params_comment
    params.require(:comment).permit(:comment, :title)
  end
end
