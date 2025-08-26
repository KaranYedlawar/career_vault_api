module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    # after login
    def respond_with(resource, _opts = {})
      token = JsonWebToken.encode(user_id: resource.id)
      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        token: token
      }, status: :ok
    end

    # after logout
    # def respond_to_on_destroy
    #   if current_user
    #     render json: {
    #       status: 200,
    #       message: "Logged out successfully."
    #     }, status: :ok
    #   else
    #     render json: {
    #       status: 401,
    #       message: "No active session."
    #     }, status: :unauthorized
    #   end
    # end
  end
end


