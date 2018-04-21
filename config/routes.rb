Rails.application.routes.draw do
  resources :votaciones_hists
  resources :comentarios
  resources :programacions
  resources :trendings
  resources :localizacion_stats
  resources :user_emisoras
  resources :emisoras
  devise_for :users
  get 'home/index'

  root to: "home#index"

  namespace 'api' do
    namespace 'v1' do
      #resources :users
      post 'users/login', to: 'users#login'
      post 'users/login_token', to: 'users#login_token'
      post 'users/login_facebook', to: 'users#login_facebook'
      post 'users/register', to: 'users#register'
      get 'emisoras/index', to: 'emisoras#index'
      post 'ubicaciones/add', to: 'ubicaciones#add'
      get 'ubicaciones/get', to: 'ubicaciones#get'
      delete 'ubicaciones/del_ubicacion', to: 'ubicaciones#del_ubicacion'
      put 'users/change_pass', to: 'users#change_pass'
      put 'users/change_user', to: 'users#change_user'
      post 'user_emisoras/setSuscription', to: 'user_emisoras#setSuscription'
      get 'trendings/get', to: 'trendings#get'
      post 'trendings/add', to: 'trendings#add'
      put 'emisoras/change_emisora', to: 'emisoras#change_emisora'
      get 'user_emisoras/isSuscripted', to: 'user_emisoras#isSuscripted'
      delete 'user_emisoras/deleteSuscription', to: 'user_emisoras#deleteSuscription'
      get 'user_emisoras/getEmisorasFavoritas', to: 'user_emisoras#getEmisorasFavoritas'
      post 'votaciones/add_cancion', to: 'votaciones#add_cancion'
      post 'votaciones/add_voto', to: 'votaciones#add_voto'
      get 'votaciones/get_canciones', to: 'votaciones#get_canciones'
      get 'votaciones/get_mis_votos', to: 'votaciones#get_mis_votos'
      delete 'votaciones/del_voto', to: 'votaciones#del_voto'
      post 'votaciones/add_cancion', to: 'votaciones#add_cancion'
      post 'comentarios/add_comentarios', to: 'comentarios#add_comentarios'
      get 'comentarios/get_comentarios', to: 'comentarios#get_comentarios'
      delete 'votaciones/del_cancion', to: 'votaciones#del_cancion'
      post 'programacions/setProgramacion', to: 'programacions#setProgramacion'
      get 'programacions/getProgramacion', to: 'programacions#getProgramacion'
      get 'estadisticas/get_ubicaciones', to: 'estadisticas#get_ubicaciones'
      get 'estadisticas/get_votaciones', to: 'estadisticas#get_votaciones'
      delete 'programacions/deleteProgramacion', to: 'programacions#deleteProgramacion'    
    end
  end
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
