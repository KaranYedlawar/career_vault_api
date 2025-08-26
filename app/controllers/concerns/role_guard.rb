module RoleGuard
  extend ActiveSupport::Concern

  def require_roles!(*roles)
    unless current_user && roles.map(&:to_s).include?(current_user.role)
      return render json: { error: 'Forbidden' }, status: :forbidden
    end
  end

  def require_admin!
    require_roles!(:admin)
  end

  def require_client!
    require_roles!(:client, :admin)
  end

  def require_freelancer!
    require_roles!(:freelancer, :admin)
  end
end
