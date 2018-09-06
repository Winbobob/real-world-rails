require 'spec_helper'

describe PerformanceController do
  before :each do
    request.env['HTTPS'] = 'on'
  end

  describe "#alerts" do
    before :each do
      Timecop.freeze(Time.utc(2016, 8, 24))
    end

    after :each do
      Timecop.return
    end

    it { expect(get(:alerts, format: :json)).to be_success }

    context "when there are active alerts" do
      before do
        create :confirmed_alert, email: "mary@example.org", created_at: DateTime.new(2016,6,19)
        create :confirmed_alert, email: "mary@example.org", created_at: DateTime.new(2016,7,19)
        create :confirmed_alert, email: "mary@example.org", created_at: DateTime.new(2016,8,19)
        create :confirmed_alert, email: "clare@example.org", created_at: DateTime.new(2016,8,19)
        create :confirmed_alert, email: "clare@example.org", created_at: DateTime.new(2016,8,19)
        create :confirmed_alert, email: "zou@example.org", created_at: DateTime.new(2016,7,6)
        create :confirmed_alert, email: "henare@example.org", created_at: DateTime.new(2016,7,6)
        create :confirmed_alert, email: "kat@example.org", created_at: DateTime.new(2016,8,5)
      end

      it "returns an json data" 

    end

    context "when people have unsubscribed" do
      before do
        alert = create :confirmed_alert, email: "mary@example.org", created_at: DateTime.new(2016,6,19)

        Timecop.freeze(Time.utc(2016, 8, 23)) { alert.unsubscribe! }

        get(:alerts, format: :json)
      end

      it "we see them subscribe in the data" 


      it "we see them unsubscribe in the data" 

    end
  end

  describe "#comments" do
    before :each do
      Timecop.freeze(Time.utc(2016, 1, 5, 10))
    end

    after :each do
      Timecop.return
    end

    it { expect(get(:comments, format: :json)).to be_success }

    context "when there are comments" do
      before do
        VCR.use_cassette('planningalerts', allow_playback_repeats: true) do
          create(:confirmed_comment, confirmed_at: 2.days.ago.to_date, email: "foo@example.com")
          create(:confirmed_comment, confirmed_at: 2.days.ago.to_date, email: "foo@example.com")
          create(:confirmed_comment, confirmed_at: 2.days.ago.to_date, email: "bar@example.com")
          create(:confirmed_comment, confirmed_at: 90.days.ago.to_date, email: "foo@example.com")
          create(:confirmed_comment, confirmed_at: 90.days.ago.to_date, email: "bar@example.com")
          create(:confirmed_comment, confirmed_at: 90.days.ago.to_date, email: "wiz@example.com")
        end
      end

      # FIXME: This example description seems wrong/is really confusing.
      it "returns an empty Array as json" 

    end
  end
end

