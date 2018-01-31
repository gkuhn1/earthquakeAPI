class RefreshEarthquakeDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    body = self.load_data()
    CSVParser.new(body).process!
  end

  def load_data()
    HTTParty.get(Rails.application.secrets.earthquakes_url, format: :plain).body
  end


end
