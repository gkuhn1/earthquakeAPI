class Earthquake < ApplicationRecord

  validates :event_id, uniqueness: true

  def calculate_distance_from_la!
    self.distance_from_la = Haversine.distance(
      Rails.application.secrets.la_latitude,
      Rails.application.secrets.la_longitude,
      self.latitude.to_f,
      self.longitude.to_f
    ).to_miles
  end

end
