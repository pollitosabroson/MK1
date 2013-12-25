MK1::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
root :to => 'paginas#home'
## ADMIN
  get '/admin' => 'admin#admin', :as => 'admin'
  get '/admin/foto/:id/:type' => 'admin#foto', :as => 'admin_foto'
  get '/manual', :to => 'admin#manual_update', :as => 'manual'
  get '/aprobadas' , :to => 'admin#aprovado', :as => 'aprovado'
  get '/borrar', :to => 'admin#delete', :as => 'borrar'
  #Paginas
  get '/show/:id', :to => 'paginas#show', :as => 'show'
  post '/show/:id/comment', :to => 'paginas#comment', :as => 'comment_pagina'
  post '/show/:id/ranking', :to => 'paginas#ranking', :as => 'ranking_pagina'
  get '/visit/', :to => 'paginas#visit', :as => 'visit' 
  
end
