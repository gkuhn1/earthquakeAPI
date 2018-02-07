require 'rails_helper'

RSpec.describe Earthquake, type: :model do

  let(:event) { described_class.new event_id: "1",
    time: DateTime.now, latitude: "35.22", longitude: "-119.01",
    event_type: "earthquake", mag: 1.0, distance_from_la: 323.20,
    place: "Place"
  }

  it "validate uniqueness by event_id" do

    expect(event.save).to be_truthy
    new_event = event.dup
    expect(new_event.save).to be_falsey

    expect(new_event.errors.messages).to eq(:event_id=>["has already been taken"])
  end

  describe "#calculate_distance_from_la!" do

    it "calculate the distance based on lat and long" do
      allow(Haversine).to receive_message_chain("distance.to_miles").and_return(100)
      event.calculate_distance_from_la!
      expect( event.distance_from_la ).to eq(100)
    end

  end

end
