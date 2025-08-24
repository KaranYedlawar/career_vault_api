Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end




  # get "up" => "rails/health#show", as: :rails_health_check
  #   # Test protected route
  # get '/me', to: ->(env) {
  #   req = ActionDispatch::Request.new(env)
  #   user = req.env['warden'].user
  #   if user
  #     [200, { 'Content-Type' => 'application/json' }, [{ id: user.id, email: user.email }.to_json]]
  #   else
  #     [401, { 'Content-Type' => 'application/json' }, [{ error: 'Not Authorized' }.to_json]]
  #   end
  # }
end
