# frozen_string_literal: true

require 'spec_helper'

describe "Ransackable Attributes" do
  let(:user) { create(:user).tap(&:generate_spree_api_key!) }
  let(:order) { create(:order_with_line_items, user: user) }
  context "filtering by attributes one association away" do
    it "does not allow the filtering of variants by order attributes" 

  end

  context "filtering by attributes two associations away" do
    it "does not allow the filtering of variants by user attributes" 

  end

  context "it maintains desired association behavior" do
    it "allows filtering of variants product name" 

  end

  context "filtering by attributes" do
    it "most attributes are not filterable by default" 


    it "id is filterable by default" 

  end

  context "filtering by whitelisted attributes" do
    it "filtering is supported for whitelisted attributes" 

  end
end

