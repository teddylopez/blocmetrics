class EventsController < ApplicationController
  before_filter :set_access_control_headers
  skip_before_action :verify_authenticity_token

  def create

    registered_application = Registration.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
      else
        @event = registered_application.events.build( event_params )
          if @event.save
            render json: @event, status: :created
          else
            render json: { error: "missing event name" }, status: :unprocessable_entity
          end
    end

  end

  def preflight
    head 200
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end


  private

  def event_params
    params.require(:event).permit(:name)
  end

end
