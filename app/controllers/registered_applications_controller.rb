class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def index
    @registered_applications = current_user.registered_applications
  end

  def new
    @user = current_user
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = current_user.registered_applications.find(params[:id])
    @events = @registered_application.events(:group => 'name')
  end

  def create
    @registered_application = current_user.registered_applications.build(registration_params)

      if @registered_application.save
        flash[:notice] = "App has been added."
        redirect_to root_path
      else
        flash.now[:alert] = "There was an error adding the app. Please try again."
        render :new
      end
  end

  def destroy
    @user = current_user
    @registered_application = RegisteredApplication.find(params[:id])

      if @registered_application.destroy
        flash[:success] = "App has been removed."
      else
        flash[:error] = "App could not be removed."
      end
      redirect_to root_path
  end

  def about

  end

  private

    def registration_params
      params.require(:registered_application).permit(:name, :url, :user_id)
    end


end
