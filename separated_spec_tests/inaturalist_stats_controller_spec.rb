require "spec_helper"

describe StatsController do

  before :all do
    OauthApplication.make!(name: "iNaturalist Android App")
    OauthApplication.make!(name: "iNaturalist iPhone App")
    [ Time.now, 1.day.ago, 1.week.ago ].each do |t|
      Observation.make!(taxon: Taxon.make!(rank: "species"),
        created_at: t)
    end
    (0..7).to_a.each do |i|
      SiteStatistic.generate_stats_for_day(i.days.ago)
    end
  end

  describe "index" do
    it "render the page HTML" 


    it "returns the latest stat by default" 


    it "render the latest stat by default" 


    it "accepts start and end dates" 

  end
end

