module Api
  class MeController < ApplicationController
    def show
      return render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
      render json: {
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    end
  end   
end
