# frozen_string_literal: true

require "rails_helper"
require "active_support/core_ext"

describe "API V3", "nodes", type: :request do
  let(:json) { JSON.parse(response.body) }
  describe "GET /api/nodes.json" do
    before do
      %w[fun ruby nodes].each_with_index { |n, i| create(:node, name: n, id: i + 1) }
    end

    it "should return the list of nodes" 

  end

  describe "GET /api/nodes/:id.json" do
    let(:node) { create(:node, topics_count: 100) }

    it "should work" 

  end
end

