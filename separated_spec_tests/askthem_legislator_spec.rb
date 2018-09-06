# -*- coding: utf-8 -*-
require "spec_helper"
require "legislator"

describe Legislator do
  before do
    @legislator = Person.new
    @legislator.extend Legislator
  end

  describe "#most_recent_chamber" do
    it "returns nothing when there is no chamber" 


    it "when attribute is present, return that" 


    it "when only old_roles are present, returns most recent" 

  end

  describe "#most_recent_chamber_title" do
    it "returns metadatum title for legislators most_recent_chamber" 

  end

  describe "#most_recent_district" do
    it "returns nothing when there is no district" 


    it "when attribute is present, return that" 


    it "when only old_roles are present, returns most recent" 

  end

  def old_roles
    { "2007-2008" =>
      [{ "term" => "2007-2008",
         "end_date" => nil,
         "district" => "Chittenden-3-1",
         "level" => "state",
         "country" => "us",
         "chamber" => "upper",
         "state" => "vt",
         "party" => "Progressive",
         "type" => "member",
         "start_date" => nil }],
      "2009-2010" =>
      [{ "term" => "2009-2010",
         "end_date" => nil,
         "district" => "Washington-5",
         "level" => "state",
         "country" => "us",
         "chamber" => "lower",
         "state" => "vt",
         "party" => "Progressive",
         "type" => "member",
         "start_date" => nil }]
    }
  end

  describe "#political_position" do
    it "returns most recent chamber" 

  end

  describe "#political_position_title" do
    it "returns most recent chamber title" 

  end

  def set_up_state_and_chamber
    state = FactoryGirl.create(:metadatum)
    state.write_attribute(:chambers, chambers)
    state.save!

    @legislator.state = state.abbreviation
    @legislator.write_attribute(:chamber, "upper")
  end

  def chambers
    { "upper"=> { "name" => "Senate", "title" => "Senator" },
      "lower" => { "name" => "House", "title" => "Representative" } }
  end
end

