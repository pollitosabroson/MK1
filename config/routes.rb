MK1::Application.routes.draw do
root :to => 'paginas#home'
## ADMIN
  get '/admin' => 'admin#admin', :as => 'admin'
  get '/admin/foto/:id/:type' => 'admin#foto', :as => 'admin_foto'
  get '/manual', :to => 'admin#manual_update', :as => 'manual'
  get '/aprobadas' , :to => 'admin#aprovado', :as => 'aprovado'
  get '/borrar', :to => 'admin#delete', :as => 'borrar'
  #Paginas
  get '/ver/:id', :to => 'paginas#show', :as => 'ver'
  post '/ver/:id/comment', :to => 'paginas#comment', :as => 'comment_pagina'
  post '/ver/:id/ranking', :to => 'paginas#ranking', :as => 'ranking_pagina'
  post "/comment/:id/like", to: "paginas#upvote", :as =>'upvote_comment'
  post "/comment/:id/dislike", to: "paginas#downvote", :as =>'downvote_comment'
  
end
