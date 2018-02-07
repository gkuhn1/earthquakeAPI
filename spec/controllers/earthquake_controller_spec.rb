require 'rails_helper'

RSpec.describe EarthquakesController, type: :controller do

  let(:earthquake_data) {{
      event_id: "1",
      time: 15.days.ago.iso8601,
      latitude: "34.023",
      longitude: "-116.7421667",
      event_type: "earthquake",
      distance_from_la: "85.9342143745399",
      mag: "1.15",
      place: "12km NNE of Cabazon, CA"
  }}

  let(:start_at) { "2018-01-16T07:58:58+00:00" }
  let(:end_at) { "2018-01-17T07:58:58+00:00" }

  describe "#index" do

    it "show when distance is less than mag * 100" do
      Earthquake.create(earthquake_data)

      resp = get :index
      json = JSON.parse(resp.body)

      expect(json["data"].size).to eq(1)
    end


    it "do not show when distance is higher than mag * 100" do
      Earthquake.create(earthquake_data.merge({distance_from_la: "250.00"}))

      resp = get :index
      json = JSON.parse(resp.body)

      expect(json["data"].size).to eq(0)
    end

    context "filter" do

      it "results based on start_at" do
        Earthquake.create(earthquake_data)

        resp = get :index, params: {start_at: 10.days.ago.iso8601}
        json = JSON.parse(resp.body)

        expect(json["data"].size).to eq(0)
      end

      it "results based on end_at" do
        Earthquake.create(earthquake_data)

        resp = get :index, params: {end_at: 16.days.ago.iso8601}
        json = JSON.parse(resp.body)

        expect(json["data"].size).to eq(0)
      end

      it "results based on both start_at and end_at" do
        Earthquake.create(earthquake_data)

        resp = get :index, params: {start_at: 16.days.ago.iso8601 , end_at: 14.days.ago.iso8601}
        json = JSON.parse(resp.body)

        expect(json["data"].size).to eq(1)
      end

      it "ignore malformed filters" do
        Earthquake.create(earthquake_data)

        resp = get :index, params: {start_at: "malformed" , end_at: "malformed"}
        json = JSON.parse(resp.body)

        expect(json["data"].size).to eq(1)
      end


    end

  end

end
