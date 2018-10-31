# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "comment/new.html.erb" do
  context "when the request is embargoed" do
    let(:info_request) { FactoryBot.create(:embargoed_request) }
    let(:comment) { info_request.comments.new }
    let(:track_thing) { TrackThing.create_track_for_request(info_request) }

    before do
      assign :info_request, info_request
      assign :comment, comment
      assign :track_thing, track_thing
      assign :in_pro_area, false
      render
    end

    it "says the comment will be public when the embargo expires" 


    it "renders the professional comment suggestions" 

  end

  context "when the request is not embargoed" do
    let(:info_request) { FactoryBot.create(:info_request) }
    let(:comment) { info_request.comments.new }
    let(:track_thing) { TrackThing.create_track_for_request(info_request) }

    before do
      assign :info_request, info_request
      assign :comment, comment
      assign :track_thing, track_thing
      assign :in_pro_area, true
      render
    end

    it "says the comment will be public" 


    it "renders the normal comment suggestions" 

  end
end

