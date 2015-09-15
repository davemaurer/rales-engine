Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'customers/random', to: 'customers#random'
      get 'customers/find', to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      get 'customers/:id/invoices', to: 'customers#invoices'
      get 'customers/:id/transactions', to: 'customers#transactions'

      resources :customers, except: [:new, :edit] do
        resources :invoices, only: [:index, :show]
      end
    end
  end
end
