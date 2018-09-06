require 'spec_helper'
require 'open_food_network/products_renderer'

feature 'Caching' do
  include AuthenticationWorkflow
  include WebHelper

  before { quick_login_as_admin }

  describe "displaying integrity checker results" do
    let(:distributor) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:open_order_cycle, distributors: [distributor]) }

    it "displays results when things are good" 


    it "displays results when there are errors" 


  end
end

