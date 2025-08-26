module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    skip_before_action :authenticate_request, only: [:create]

    # POST /users
    def create
      build_resource(sign_up_params)

      resource.save
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'Signed up successfully.' },
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :ok
      else
        render json: {
          status: { code: 422, message: "User couldn't be created successfully." },
          errors: resource.errors.full_messages
        }, status: :unprocessable_entity
      end
    end

    private

    def respond_with(resource, _opts = {})
      render json: resource
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
