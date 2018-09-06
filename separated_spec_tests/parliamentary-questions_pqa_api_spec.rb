require 'feature_helper'

describe HealthCheck::PqaApi do
  let(:pqa) { HealthCheck::PqaApi.new }


  describe '.time_to_run?' do
    it 'should be true if the timestamp file does not exist' 


    it 'should be true if the timestamp file contains a time more than 15 minutes ago' 


    it 'should be false if the timestamp file contains a time less than 15 minutes ago' 

  end

  context '#available?' do
    it 'returns true if the parliamentary questions API is available' 


    it 'returns false if the parliamentary questions API is not available' 

  end

  context '#accessible?' do
    let(:resp_403) { double Net::HTTPResponse, code: 403, body: 'unauthorised' }

    it 'returns true if the parliamentary questions API is accessible with our credentials' 


    it 'returns false if the parliamentary questions API is not accessible with our credentials' 

  end

  context '#error_messages' do
    it 'returns the exception messages if there is an error accessing the parliamentary questions API' 


    it 'returns an error an backtrace for errors not specific to a component' 

  end


  context '#record_result' do
    it 'should write timestamp and OK if no error messages' 

    
    it 'should write timestamp and FAIL and error messages if any errors' 

  end
end


def contents_of_timestamp_file
  File.open(HealthCheck::PqaApi::TIMESTAMP_FILE, 'r') do |fp|
    fp.gets
  end
end


def delete_timestamp_file
  if File.exist?(HealthCheck::PqaApi::TIMESTAMP_FILE)
    File.unlink(HealthCheck::PqaApi::TIMESTAMP_FILE)
  end
end

