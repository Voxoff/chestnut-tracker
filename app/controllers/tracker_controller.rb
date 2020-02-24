class TrackerController < ApplicationController
  def tracker
    referrer_header = request.headers["REQUEST_URI"]
    referrer_param = params[:referrer]
    Subtracker.find_by(referrer: referrer_param).increment
  end
end
