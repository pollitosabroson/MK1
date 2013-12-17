class AdminController < ApplicationController
  def admin
    @fotos = Mk1.order('created_at DESC').all
  end
  def foto
    type = params[:type]
    id = params[:id]
    foto = Foto.find(id)
    if type == "1"
      foto.publicado = true
    elsif type == "0"
      foto.publicado = false
    end
    if foto.save
      redirect_to admin_path
    end
  end
  def manual_update
    Instagram.tag_recent_media("mk1").data.each do |data|
      puts data.inspect
      foto = Mk1.find_or_create_by_instagram_id(
        :instagram_id => data.id,
        :instagram_link => data.link,
        :pic_thumb => data.images.thumbnail.url,
        :pic_med => data.images.low_resolution.url,
        :pic_large => data.images.standard_resolution.url,
        :fullname => data.user.full_name,
        :username => data.user.username
      )
      foto.save
    end
    redirect_to admin_path
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |user, password| 
        session[:admin]= (user == ENV['username'] && password == ENV['password'])
    end
  end
end
