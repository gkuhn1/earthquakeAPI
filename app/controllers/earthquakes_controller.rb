class EarthquakesController < ApplicationController

  def index
    earthquakes = Earthquake
      .where("distance_from_la <= mag * 100")
      .where(time: time_range())
      .order(time: :desc)

    render :json => {data: earthquakes}
  end

  private

    def time_range
      (get_start_at()..get_end_at())
    end

    def get_start_at
      DateTime.parse(params["start_at"])
    rescue
      30.days.ago
    end

    def get_end_at
      DateTime.parse(params["end_at"])
    rescue
      0.second.from_now
    end
end
