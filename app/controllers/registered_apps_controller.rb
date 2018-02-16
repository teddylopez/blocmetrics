class RegisteredAppsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_apps = current_user.registered_apps
  end

  def new
    @user = current_user
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = current_user.registered_apps.build(registered_app_params)

      if @registered_app.save
        flash[:notice] = "App has been added."
        redirect_to root_path
      else
        flash.now[:alert] = "There was an error adding the app. Please try again."
        render :new
      end
  end

  def destroy
    set_registered_app

      if @registered_app.destroy
        flash[:success] = "App has been removed."
      else
        flash[:error] = "App could not be removed."
      end
      redirect_to root_path
  end

  private

    def set_registered_app
      @registered_app ||= current_user.registered_apps.find(params[:id])
    end

    def registered_app_params
      params.require(:registered_app).permit(:name, :url)
    end


end
