Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
        resources :astronauts
        resources :countries
        resources :users
      end
  end
end
