require 'spec_helper'

module OpenFoodNetwork
  describe EnterpriseInjectionData do
    describe "relatives" do
      let!(:enterprise) { create(:distributor_enterprise) }
      let!(:producer) { create(:supplier_enterprise) }
      let!(:producer_inactive) { create(:supplier_enterprise, sells: 'unspecified') }
      let!(:er_p)  { create(:enterprise_relationship, parent: producer, child: enterprise) }
      let!(:er_pi) { create(:enterprise_relationship, parent: producer_inactive, child: enterprise) }

      it "only loads activated relatives" 


      it "loads self where appropiate" 

    end
  end
end
