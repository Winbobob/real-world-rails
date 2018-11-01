require "spec_helper"

describe Csv::ExportSessionsToCsv do
  before(:each) do
    @subject = Csv::ExportSessionsToCsv.new
  end

  after(:each) do
    @subject.clean
  end

  it "with no sessions the zip is empty" 


  it "with one session with one stream and with one measurement the zip contains one file with the right CSV content and filename" 


  def create_stream!(attributes)
    Stream.create!(
      sensor_package_name: attributes[:sensor_package_name],
      sensor_name: attributes[:sensor_name],
      measurement_type: attributes[:measurement_type],
      unit_name: attributes[:unit_name],
      session: attributes[:session],
      measurement_short_type: "dB",
      unit_symbol: "dB",
      threshold_very_low: 20,
      threshold_low: 60,
      threshold_medium: 70,
      threshold_high: 80,
      threshold_very_high: 100
    )
  end

  def create_measurement!(attributes)
    Measurement.create!(
      time: attributes.fetch(:time),
      latitude: attributes.fetch(:latitude),
      longitude: attributes.fetch(:longitude),
      value: attributes.fetch(:value),
      milliseconds: attributes.fetch(:milliseconds),
      stream: attributes.fetch(:stream)
    )
  end
end

