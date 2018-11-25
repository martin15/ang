Rails.application.routes.draw do


  get 'about_us' => "about_us#index"
  get 'contact_us' => 'contact_us#index'
  post 'contact_us' => 'contact_us#create', :as => 'save_contact_us'
  get 'news' => "news#index", as: "news_list"
  get 'news/:permalink' => "news#show", as: "news_detail"
  get 'portfolios' => "portfolios#index", as: "portfolios"
  get 'portfolios/:permalink' => "portfolios#show", as: "portfolio"
  get 'products/search' => "products#search", as: "products_search"
  get 'products/:category_permalink/:brand_permalink' => "products#index", as: "products_by_category"
  get 'products/:category_permalink/:brand_permalink/:product_permalink' => "products#show", as: "product"
  post 'products/reload_brand' => "products#reload_brand"
  get 'service_center' => "service_center#index"
  get 'store_location' => "store_location#index"

  get    '/login' => 'session#new', :as => "login"
  post   '/login' => 'session#create', :as => "login_create"
  delete '/logout' => 'session#destroy', :as => "logout"

  get "admin" => "admin/dashboard#index", as: "admin"
  namespace :admin do
    resources :banners
    resources :brands do
      member do
        resources :service_centers, param: :service_center_id
      end
    end
    resources :categories
    resources :news
    resources :portfolios do
      member do
        resources :portfolio_images, except: [:index], param: :portfolio_image_id
      end
    end
    resources :products do
      collection do
        post :reload_brand
      end
      member do
        resources :product_images, except: [:index], param: :product_image_id
      end
    end
    resources :store_locations
    resources :testimonies
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
