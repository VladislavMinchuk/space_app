Rails.application.routes.draw do
  namespace 'api' do
    resources :astronauts
  end
end
