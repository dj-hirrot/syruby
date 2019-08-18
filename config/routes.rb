Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :main do
        post 'home/get_test_text'
      end
    end
  end
  root 'home#top'
end
