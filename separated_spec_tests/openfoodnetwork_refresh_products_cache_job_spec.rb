require 'spec_helper'
require 'open_food_network/products_renderer'

describe RefreshProductsCacheJob do
  let(:distributor) { create(:distributor_enterprise) }
  let(:order_cycle) { create(:simple_order_cycle) }

  it "renders products and writes them to cache" 


  describe "fetching products JSON" do
    let(:job) { RefreshProductsCacheJob.new distributor.id, order_cycle.id }
    let(:pr) { double(:products_renderer, products_json: nil) }

    it "fetches products JSON" 

  end
end

