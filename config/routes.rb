Rails.application.routes.draw do
  get 'index/(:id)' => 'index#index'
  get 'detail/(:id)' => 'index#detail'
  post 'save/' => 'index#save'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
