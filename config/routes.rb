Rails.application.routes.draw do
  root to: redirect('/insider/search')

  namespace :insider do
    root to: redirect('/insider/search')

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'

    namespace :search, module: 'searches' do
      root to: 'dashboard#show'

      resources 'apartments', only: %w(index show)
      resources 'franchise', controller: 'franchises', only: %w(index show)
      resources 'industrial', controller: 'industrials', only: %w(index show)
      resources 'land', controller: 'lands', only: %w(index show)
      resources 'offices', only: %w(index show)
      resources 'retail', only: %w(index show)
    end
  end

  resources :users
end
