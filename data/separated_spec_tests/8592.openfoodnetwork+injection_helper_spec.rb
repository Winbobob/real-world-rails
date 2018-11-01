require 'spec_helper'

describe InjectionHelper, type: :helper do
  let!(:enterprise) { create(:distributor_enterprise, facebook: "roger") }

  let!(:distributor1) { create(:distributor_enterprise) }
  let!(:distributor2) { create(:distributor_enterprise) }
  let!(:user) { create(:user)}
  let!(:d1o1) { create(:completed_order_with_totals, distributor: distributor1, user_id: user.id, total: 10000)}
  let!(:d1o2) { create(:completed_order_with_totals, distributor: distributor1, user_id: user.id, total: 5000)}
  let!(:d2o1) { create(:completed_order_with_totals, distributor: distributor2, user_id: user.id)}

  it "will inject via AMS" 


  it "injects enterprises" 


  it "only injects activated enterprises" 


  it "injects shipping_methods" 


  it "injects payment methods" 


  it "injects current order" 


  it "injects taxons" 


  it "only injects credit cards with a payment profile" 

end

