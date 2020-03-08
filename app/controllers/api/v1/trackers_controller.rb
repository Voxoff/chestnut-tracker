class Api::V1::TrackersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    return logger.info "No Url param" unless params[:url]

    organisation = Organisation.find_by(name: strong_params[:id])
    return logger.info "Unidentified organisation" unless organisation

    @tracker = Tracker.find_or_create_by(referrer: strong_params[:url], organisation: organisation)
    TrackSizeJob.perform_now(@tracker) if @tracker.count.zero?
    @tracker.increment!(:count)

    # Avoid MIME type mismatch
    # headers["Content-Type"] = "application/javascript"
  end

  private

  def no_script
    if no_script_param == 1
      referrer = request.headers[:HTTP_REFERER]
      # https://stackoverflow.com/questions/6880659/in-what-cases-will-http-referer-be-empty
      return logger.info "No http referrer" unless referrer

      url = referrer + 'noscript'
    end
  end

  def no_script_param
    params.permit(:noscript)[:noscript]
  end

  def strong_params
    params.permit(:url, :id)
  end

  def get_rid_of_params
    # We could filter out current params and replace it with a default(first) value
    params = url.match(/\?(.*)/)
    params = params[1].split("&").map { |param| param.split("=")}
  end

  def track_size
    begin
      google_api = "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url="
      response = HTTParty.get(google_api + Tracker.first.referrer)
    rescue => e
      # Anything else to do?
      puts e
    end
    return unless response

    items = response.dig("lighthouseResult", "audits", "network-requests", "details", "items")
    transfer_sizes = items.map { |hash| hash["transferSize"]} if items
    total_size = transfer_sizes.compact.reduce(:+) if transfer_sizes
    Tracker.update(size: total_size) if total_size
  end
end
