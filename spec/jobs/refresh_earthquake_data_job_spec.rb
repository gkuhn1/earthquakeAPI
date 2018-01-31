require 'rails_helper'

RSpec.describe RefreshEarthquakeDataJob, type: :job do

  let(:csv_data) { "custom,csv,data" }

  it "fetch data from the url using httparty and pass it to CSVParser module" do
    expect(HTTParty).to receive_message_chain("get.body").and_return(csv_data)

    expect(CSVParser).to receive(:new).with(csv_data).and_return(double("csv_parser", process!: :ok))

    subject.perform
  end

end
