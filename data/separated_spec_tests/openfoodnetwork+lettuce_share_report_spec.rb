require 'open_food_network/lettuce_share_report'

module OpenFoodNetwork
  describe LettuceShareReport do
    let(:user) { create(:user) }
    let(:report) { LettuceShareReport.new user, {}, true }
    let(:v) { create(:variant) }

    describe "grower and method" do
      it "shows just the producer when there is no certification" 


      it "shows producer and certification when a certification is present" 

    end

    describe "gst" do
      it "handles tax category without rates" 

    end

    describe "table" do
      it "handles no items" 


      describe "lists" do
        let(:v2) { create(:variant) }
        let(:v3) { create(:variant) }
        let(:v4) { create(:variant, count_on_hand: 0, on_demand: true) }
        let(:hub_address) { create(:address, :address1 => "distributor address", :city => 'The Shire', :zipcode => "1234") }
        let(:hub) { create(:distributor_enterprise, :address => hub_address) }
        let(:v2o) { create(:variant_override, hub: hub, variant: v2) }
        let(:v3o) { create(:variant_override, hub: hub, variant: v3, count_on_hand: 0) }

        it "all items" 


        it "only available items" 


        it "only available items considering overrides" 


      end
    end
  end
end

