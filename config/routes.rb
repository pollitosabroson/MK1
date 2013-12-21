MK1::Application.routes.draw do
root :to => 'paginas#home'
## ADMIN
  get '/admin' => 'admin#admin', :as => 'admin'
  get '/admin/foto/:id/:type' => 'admin#foto', :as => 'admin_foto'
  get '/manual', :to => 'admin#manual_update', :as => 'manual'
  get '/ver/:id', :to => 'paginas#show', :as => 'ver'
  
end
