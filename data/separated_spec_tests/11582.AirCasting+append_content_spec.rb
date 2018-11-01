require "spec_helper"

describe Csv::AppendContent do
  before(:each) do
    @subject = Csv::AppendContent.new
  end

  it "with one stream with one measurement appends the correct measurement column" 
  it "with one stream with no measurements appends nine lines" 


  it "with one stream and one measurement appends ten lines" 


  it "with one stream and two measurements appends the correct two measurement lines" 


  it "with two streams appends the headers for two stream" 
  it "with two streams appends the correct sensor package names in the second line" 
  it "with two streams appends the correct sensor names in the fourth line" 
  it "with two streams appends the correct measurement types in the sixth line" 
  it "with two streams appends the correct measurement units in the eighth line" 
  it "with two streams with two measurements with different sensor names but same timestamp and coordinates appends the correct single measurement line" 
  it "with two streams with two measurements with the same timestamp but different coordinates appends the correct two measurement lines" 
  it "with two streams with two measurements with different timestamps but same coordinates appends the correct two measurement lines" 
  it "with two streams with two measurements with different timestamps and different coordinates appends the correct content" 


  def build_stream_parameters(attr = {})
    {
      "measurement_types" => attr.fetch("measurement_types", []),
      "measurement_units" => attr.fetch("measurement_units", []),
      "sensor_names" => attr.fetch("sensor_names", []),
    }
  end

  def build_measurement(attr = {})
    {
      "measurement_time" => attr.fetch("measurement_time", Time.current),
      "measurement_milliseconds" => attr.fetch("measurement_milliseconds", 123),
      "measurement_latitude" => attr.fetch("measurement_latitude", 123.4),
      "measurement_longitude" => attr.fetch("measurement_longitude", 123.4),
      "measurement_value" => attr.fetch("measurement_value", 123.4),
      "stream_sensor_name" => attr.fetch("stream_sensor_name", "abc"),
      "session_title" => attr.fetch("session_title", "abc"),
    }
  end
end

