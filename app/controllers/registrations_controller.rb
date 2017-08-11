class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registrations = current_user.registrations
  end

  def new
    @user = current_user
    @registration = Registration.new
  end

  def create
    @registration = current_user.registrations.build(registration_params)

      if @registration.save
        flash[:notice] = "App has been added."
        redirect_to root_path
      else
        flash.now[:alert] = "There was an error adding the app. Please try again."
        render :new
      end
  end

  def destroy
    set_registration

      if @registration.destroy
        flash[:success] = "App has been removed."
      else
        flash[:error] = "App could not be removed."
      end
      redirect_to root_path
  end

  private

    def set_registration
      @registration ||= current_user.registrations.find(params[:id])
    end

    def registration_params
      params.require(:registration).permit(:name, :url)
    end


end
