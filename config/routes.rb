Rails.application.routes.draw do
  resources :site_contents do
    patch :order_up, on: :member
    patch :order_down, on: :member
  end
end
