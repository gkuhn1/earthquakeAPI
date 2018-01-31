class CSVParser < Object

  def initialize(body)
    @csv = CSV.parse(body, headers: true)
  end

  def process!

    @all_event_ids = Earthquake.select(:event_id).map { |e| e.event_id }

    @csv.each do |row|
      event_id = row.field("id")

      return if @all_event_ids.include?(event_id)

      event = Earthquake.new event_id: event_id,
        time: row.field("time").to_datetime,
        latitude: row.field("latitude"),
        longitude: row.field("longitude"),
        event_type: row.field("type"),
        mag: row.field("mag").to_f,
        place: row.field("place")

      event.calculate_distance_from_la!

      event.save
    end

  end

end