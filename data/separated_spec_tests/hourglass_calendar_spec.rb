describe "iCal Calendars" do
  describe "GET /pto.ics" do
    before do
      @original_calendar_password = ENV["CALENDAR_PASSWORD"]
      @password = ENV["CALENDAR_PASSWORD"] = "s3cr3t"
    end

    after do
      ENV["CALENDAR_PASSWORD"] = @original_calendar_password
      Rails.cache.clear
    end

    it "returns a cached response when authenticated" 


    it "returns a cached response when not authenticated" 


    it "returns a cached response when authenticated with the wrong password" 

  end
end

