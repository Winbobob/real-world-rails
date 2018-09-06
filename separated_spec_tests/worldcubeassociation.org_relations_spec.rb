# frozen_string_literal: true

require 'rails_helper'
require 'relations'

RSpec.describe "Relations" do
  before do
    Linking.create! [
      { wca_id: "2013KOSK01", wca_ids: %w(2005FLEI01 2008VIRO01) },
      { wca_id: "2005FLEI01", wca_ids: %w(2013KOSK01 2008VIRO01 1982PETR01) },
      { wca_id: "2008VIRO01", wca_ids: %w(2013KOSK01 2005FLEI01 1982PETR01) },
      { wca_id: "1982PETR01", wca_ids: %w(2005FLEI01 2008VIRO01) },
    ]
  end

  describe ".get_chain" do
    it "returns any of shortest valid chains linking two people" 


    it "when there is no relation returns an empty array" 

  end

  describe ".compute_linkings", clean_db_with_truncation: true do
    it "creates linkings by computing 1st degree relation for each person" 

  end
end

