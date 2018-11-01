require 'rails_helper'

def event_for_dates(starts_at, ends_at)
  event = build(:event_with_no_sessions)
  event.event_sessions << build(:event_session, event: @event, starts_at: starts_at, 
    ends_at: 4.hours.since(starts_at) )

  event.event_sessions << build(:event_session, event: @event, starts_at: 4.hours.until(ends_at),
    ends_at: ends_at )

  event.save
  event
end

describe EventsHelper do
  describe "#formatted_event_date_range(event)" do

    context "when called with an event occurring in a single month" do
      before(:each) do
        @event = event_for_dates( DateTime.parse('2013-02-12'),
                                  DateTime.parse('2013-02-14'))
      end

      it "should return a string with that month once" 

    end

    context "when called with an event occuring across two months but one year" do
      before(:each) do
        @event = event_for_dates( DateTime.parse('2013-02-27'),
                                  DateTime.parse('2013-03-02'))
      end

      it "should return a string with both of those months but one year" 

    end

    context "when called with an event occuring across two years" do
      before(:each) do
        @event = event_for_dates(DateTime.parse('2013-12-30'),
                                 DateTime.parse('2014-01-02'))
      end


      it "should return a string with both months and years" 

    end
  end


  describe "#google_calendar_event_url(event, event_session)" do
    let(:event) { event_for_dates(DateTime.tomorrow, DateTime.tomorrow + 1.day) }
    let(:event_session) { event.event_sessions.first }

    context "by default" do
      before do
        @calendar_event_url = URI.parse(helper.google_calendar_event_url(event, event_session))
        @calendar_event_params = Rack::Utils.parse_nested_query(@calendar_event_url.query)
      end

      it "uses the correct google endpoint" 


      it "configures the event title" 


      it "formats the title the way we talked about" 


      it "provides the start and end time as 'dates'" 


      it "puts a link to the event in the details" 

    end
  end
end

