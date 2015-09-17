Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do

      get 'customers/random', to: 'customers#random'
      get 'customers/find', to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      get 'customers/:id/invoices', to: 'customers#invoices'
      get 'customers/:id/transactions', to: 'customers#transactions'
      get 'customers/:id/favorite_merchant', to: 'customers#favorite_merchant'

      resources :customers, except: [:new, :edit]

      get 'merchants/random', to: 'merchants#random'
      get 'merchants/find', to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find_all'
      get 'merchants/:id/items', to: 'merchants#items'
      get 'merchants/:id/invoices', to: 'merchants#invoices'
      get 'merchants/:id/revenue', to: 'merchants#revenue'
      get 'merchants/:id/favorite_customer', to: 'merchants#favorite_customer'

      resources :merchants, except: [:new, :edit] do
        resources :items, only: :show
        resources :invoices, only: :show
      end

      get 'items/random', to: 'items#random'
      get 'items/find', to: 'items#find'
      get 'items/find_all', to: 'items#find_all'
      get 'items/:id/invoice_items', to: 'items#invoice_items'
      get 'items/:id/merchant', to: 'items#merchant'

      resources :items, except: [:new, :edit] do
        resources :invoice_items, only: :show
      end

      get 'invoices/random', to: 'invoices#random'
      get 'invoices/find', to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      get 'invoices/:id/transactions', to: 'invoices#transactions'
      get 'invoices/:id/invoice_items', to: 'invoices#invoice_items'
      get 'invoices/:id/items', to: 'invoices#items'
      get 'invoices/:id/customer', to: 'invoices#customer'
      get 'invoices/:id/merchant', to: 'invoices#merchant'

      resources :invoices, except: [:new, :edit] do
        resources :transactions, only: :show
        resources :invoice_items, only: :show
      end

      get 'transactions/random', to: 'transactions#random'
      get 'transactions/find', to: 'transactions#find'
      get 'transactions/find_all', to: 'transactions#find_all'
      get 'transactions/:id/invoice', to: 'transactions#invoice'

      resources :transactions, except: [:new, :edit]

      get 'invoice_items/random', to: 'invoice_items#random'
      get 'invoice_items/find', to: 'invoice_items#find'
      get 'invoice_items/find_all', to: 'invoice_items#find_all'
      get 'invoice_items/:id/invoice', to: 'invoice_items#invoice'
      get 'invoice_items/:id/item', to: 'invoice_items#item'

      resources :invoice_items, except: [:new, :edit]
    end
  end
end
