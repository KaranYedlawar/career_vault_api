Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions'
             },
             defaults: { format: :json }  
           
  namespace :api do
    get :me,   to: 'me#show'
  end
end
