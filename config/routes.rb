# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   root 'home#home'

# end
Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'countries' => 'countries#index'
      delete 'country' => 'countries#delete'
      put 'country' => 'countries#update'
    end
  end
end
