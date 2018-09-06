require 'spec_helper'
require 'calagator/vcalendar'

module Calagator

describe VVenue, "when parsing VVENUE", :type => :model do
  subject do
    described_class.new(<<-ICAL)
BEGIN:VVENUE
X-VVENUE-INFO:http://evdb.com/docs/ical-venue/draft-norris-ical-venue.
  html
UID:V0-001-001423875-1@eventful.com
NAME:Apple Store Pioneer Place
DESCRIPTION:(503) 222-3002 Driving Directions & Map  Store Hours:  Mon
   - Fri: 9:30 a.m. to 9:00 p.m. Sat: 9:30 a.m. to 8:00 p.m. Sun: 11:00
  a.m. to 6:00 p.m.
ADDRESS:700 Southwest Fifth Avenue Suite #1035
CITY:Portland
REGION;ABBREV=OR:Oregon
COUNTRY;ABBREV=USA:United States
POSTALCODE:97204
GEO:45.518798;-122.677583
URL;X-LABEL=Venue Info:http://eventful.com/V0-001-001423875-1
CATEGORIES:apple applecom appleinc technology
END:VVENUE
ICAL
  end

  it "should have the address as-is" 


  it "should have the locality as is" 


  it "should find a property set by its key" 


  it "should find a property set by its key and meta-qualifier by its key when one wasn't specified" 


  it "should find a property set by its key and multiple meta-qualifiers by its key when one wasn't specified" 


  it "should find a property set by its key and meta-qualifier with odd characters by its key when one wasn't specified" 


  it "responds to fields that it has" 


  it "does not respond to fields that it does not have" 


  it "raises an exception if field is not there" 

end

end

