class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # POST /users
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
      if resource.active_for_authentication?
        # sign_up(resource_name, resource)              removed this line because this app is pureyly API based
        render json: {
          message: "Signed up successfully.",
          user: resource
        }, status: :created
      else
        expire_data_after_sign_in!
        render json: {
          message: "Signed up but not active.",
          user: resource
        }, status: :created
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: {
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
