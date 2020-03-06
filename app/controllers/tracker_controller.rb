class TrackerController < ApplicationController
  def tracker
    referrer_header = request.headers["REQUEST_URI"]
    referrer_param = params[:referrer]
    Tracker.find_by(referrer: referrer_param).increment
  end

  def show
    # referrer_header = request.headers["REQUEST_URI"]
    # request.headers[:HTTP_REFERER]
    # return unless params[:url]

    organisation = Organisation.find(params[:id])
    tracker = Tracker.find_or_create_by(referrer: url_params, organisation: organisation)
    tracker.increment!(:count)
    binding.pry
    render json: {tracked: true}, status: :created
  end

  def url_params
    params.permit(:url)
  end
end
