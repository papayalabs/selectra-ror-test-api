Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :providers do
        post 'create_tracking_pixel'
      end
      resources :tracking_pixels do
        put 'converted'
      end
    end
    get '/404', to: 'errors#render_404'
  end
end
