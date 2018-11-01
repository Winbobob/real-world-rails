require 'spec_helper'

describe CommentsController do
  before :each do
    request.env['HTTPS'] = 'on'
  end

  describe "#per_week" do
    before :each do
      Timecop.freeze(Time.local(2016, 1, 5))

      create(:authority, short_name: "Blue Mountains", id: 1)
    end

    after :each do
      Timecop.return
    end

    subject(:get_authority_comments_per_week) do
      get(:per_week, authority_id: "blue_mountains", format: :json)
    end

    it { expect(get_authority_comments_per_week).to be_success }

    context "when the authority has no applications" do
      it "returns an empty Array as json" 

    end

    it "returns comments per week for an authority as json" 

  end
end

