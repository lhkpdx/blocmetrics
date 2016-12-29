module RegisteredApplicationsHelper

  def registration_owner?
    @registered_application = RegisteredApplication.find(params[:id])
    user = @registered_application.user
    if user == current_user
      true
    end
  end

  def user_has_registrations?

  end

  def user_authorized_to_edit?
  end

  def user_authorized_to_edit?
  end

end
