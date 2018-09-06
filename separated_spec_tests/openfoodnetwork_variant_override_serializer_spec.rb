describe Api::Admin::VariantOverrideSerializer do
  let(:variant) { create(:variant) }
  let(:hub) { create(:distributor_enterprise) }
  let(:price) { 77.77 }
  let(:count_on_hand) { 11111 }
  let(:variant_override) { create(:variant_override, variant: variant, hub: hub, price: price, count_on_hand: count_on_hand) }

  it "serializes a variant override" 

end

