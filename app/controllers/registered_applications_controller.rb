class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user
    if @registered_application.save
      redirect_to @registered_application, notice: "Registration saved successfully"
    else
      flash.now[:alert] = "Error creating registration.  Please try again"
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Registration was updated"
      redirect_to @registered_application
    else
      flash.now[:alert] = "Error saving registration.  Please try again"
      render :edit
    end
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = Event.where(registered_application_id: @registered_application.id)
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the registration."
      render :show
    end
  end

 private

 def registered_application_params
   params.require(:registered_application).permit(:name, :url, :user_id)
 end

end
