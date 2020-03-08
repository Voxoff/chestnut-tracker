class TrackSizeJob < ApplicationJob
  queue_as :default

  def perform(tracker)
    begin
      google_api = "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url="
      response = HTTParty.get(google_api + tracker.referrer)
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
