require 'rails_helper'

RSpec.describe ClosePetitionsJob, type: :job do
  context "for a petition opened in the winter" do
    let!(:petition) {
      FactoryBot.create(:open_petition, open_at: "2015-12-29T10:00:00Z")
    }

    around do |example|
      travel_to(now)
      example.run
      travel_back
    end

    context "and the closing date has not passed" do
      let(:now) { "2016-06-28T07:00:00Z".in_time_zone }

      it "does not change the petition state" 

    end

    context "and the closing date has passed" do
      let(:now) { "2016-06-29T07:00:00Z".in_time_zone }

      it "does change the petition debate state" 

    end
  end

  context "for a petition opened in the summer" do
    let!(:petition) {
      FactoryBot.create(:open_petition, open_at: "2016-06-29T10:00:00Z")
    }

    around do |example|
      travel_to(now)
      example.run
      travel_back
    end

    context "and the debate date has not passed" do
      let(:now) { "2016-12-28T07:00:00Z".in_time_zone }

      it "does not change the petition state" 

    end

    context "and the debate date has passed" do
      let(:now) { "2016-12-29T07:00:00Z".in_time_zone }

      it "does change the petition state" 

    end
  end
end

