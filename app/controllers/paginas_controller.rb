class PaginasController < ApplicationController
  def home
    @fotos = Mk1.where(:publicado => true).order('created_at DESC').all
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
  end

  def suscribir
    render :text => "#{params['hub.challenge']}"
  end
end
