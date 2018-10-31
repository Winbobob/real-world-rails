require 'helper'
require 'faraday_middleware/response/parse_dates'
require 'json'

describe FaradayMiddleware::ParseDates, :type => :response do
  let(:parsed){
    if RUBY_VERSION > "1.9"
      "2012-02-01 13:14:15 UTC"
    else
      "Wed Feb 01 13:14:15 UTC 2012"
    end
  }

  it "parses dates" 


  it "parses dates with milliseconds" 


  it "parses nested dates in hash" 


  it "parses nested dates in arrays" 


  it "returns nil when body is empty" 


  it "leaves arrays with ids alone" 


  it "does not parse date-like things" 

end

