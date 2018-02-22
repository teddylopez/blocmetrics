class RegisteredAppsController < ApplicationController
  before_action :authenticate_user!, except: [:about, :info]

  def about
  end

  def info
  end

  def index
    @registered_apps = current_user.registered_apps
  end

  def show
    @registered_app = current_user.registered_apps.find(params[:id])
    @events = @registered_app.events(:group => 'name')
  end

  def new
    @user = current_user
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = current_user.registered_apps.build(registered_app_params)

      if @registered_app.save
        flash[:notice] = "App has been added."
        redirect_to @registered_app
      else
        flash.now[:alert] = "There was an error adding the app. Please try again."
        render :new
      end
  end

  def destroy
    @user = current_user
    @registered_app = RegisteredApp.find(params[:id])

      if @registered_app.destroy
        flash[:success] = "App has been removed."
      else
        flash[:error] = "App could not be removed."
      end
      redirect_to registered_apps_path action: "index"
  end

  private

  def registered_app_params
    params.require(:registered_app).permit(:name, :url, :user_id)
  end


end
