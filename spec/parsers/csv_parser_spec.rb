require 'rails_helper'

RSpec.describe CSVParser, type: :model do

  let(:csv_data) do
    "time,latitude,longitude,depth,mag,magType,nst,gap,dmin,rms,net,id,updated," \
    "place,type,horizontalError,depthError,magError,magNst,status,locationSource," \
    "magSource\n2018-01-31T03:59:50.630Z,38.8256683,-122.8554993,1.9,1.96,md,32," \
    "65,0.002159,0.04,nc,nc72961631,2018-01-31T04:02:48.000Z,\"10km WNW of The Ge" \
    "ysers, CA\",earthquake,0.19,0.27,0.12,11,automatic,nc,nc"
  end

  let(:subject) { described_class.new(csv_data) }

  describe "process!" do

    it "process an earthquake event calling calculate_distance_from_la! method" do
      expect_any_instance_of(Earthquake).to receive(:calculate_distance_from_la!).once.and_call_original

      subject.process!
    end

    it "get all events from database" do
      expect(Earthquake).to receive(:select).once.and_return([])
      subject.process!
    end

    it "process only once each event" do
      expect(Earthquake).to receive(:select).once.and_return([double("earthquake", event_id: "nc72961631")])
      expect(Earthquake).not_to receive(:new)

      subject.process!
    end
  end

end
