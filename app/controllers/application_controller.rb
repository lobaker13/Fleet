class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_trip

  def get_trip
  	@current_trip = Trip.find(params[:id])
  end
end
