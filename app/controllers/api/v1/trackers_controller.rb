class Api::V1::TrackersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    # referrer_header = request.headers["REQUEST_URI"]
    # request.headers[:HTTP_REFERER]
    # return unless params[:url]

    organisation = Organisation.find_by(name: strong_params[:id])
    @tracker = Tracker.find_or_create_by!(referrer: strong_params[:url], organisation: organisation)
    track_size if @tracker.count.zero?
    @tracker.increment!(:count)
    return 204
  end

  def strong_params
    params.permit(:url, :id)
  end

  def track_size
    begin
      google_api = "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url="
      response = HTTParty.get(google_api + Tracker.first.referrer)
    rescue => e
      # Anything else to do??
      puts e
    end
    return unless response

    items = response.dig("lighthouseResult", "audits", "network-requests", "details", "items")
    transfer_sizes = items.map { |hash| hash["transferSize"]} if items
    total_size = transfer_sizes.compact.reduce(:+) if transfer_sizes
    Tracker.update(size: total_size) if total_size
  end
end
