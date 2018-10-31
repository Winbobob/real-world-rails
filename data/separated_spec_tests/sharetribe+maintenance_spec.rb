describe Maintenance do
  describe "self.parse_time_from_env" do
    it "accepts nil, Time and String" 

  end

  describe "show_warning?" do

    context "next maintenance scheduled" do

      let(:next_at) { Time.utc(2016, 3, 21, 12, 0, 0) }
      let(:next_maintenance) { Maintenance.new(next_at) }

      it "returns false if too early to show the warning" 


      it "returns true if it's time to show the warning" 


      it "returns true if the time is in the past" 

    end

    context "no maintenance scheduled" do

      let(:next_at) { "" }
      let(:next_maintenance) { Maintenance.new(next_at) }

      it "returns always false" 

    end
  end

  describe "minutes to" do

    context "next maintenance scheduled" do

      let(:next_at) { Time.utc(2016, 3, 21, 12, 0, 0) }
      let(:next_maintenance) { Maintenance.new(next_at) }

      it "returns minutes to next maintenance" 


      it "returns zero if next maintenance is in the past" 

    end

    context "no maintenance scheduled" do

      let(:next_at) { "" }
      let(:next_maintenance) { Maintenance.new(next_at) }

      it "returns always 0" 

    end
  end
end

