Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :main do
        namespace :home do
          post :get_test_text
        end
      end
    end
  end
  root 'home#top'
end
