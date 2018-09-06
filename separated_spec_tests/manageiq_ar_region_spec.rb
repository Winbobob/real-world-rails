describe ArRegion do
  it "exposes #region_number as a virtual column" 


  it "exposes #region_description as a virtual column" 


  context "#miq_region" do
    before { MiqRegion.seed }

    let!(:vm) { FactoryGirl.create(:vm) }

    it "returns the MiqRegion record" 


    it "is cached between calls" 

  end

  context "#region_description" do
    it "when the region exists" 


    it "when the region does not exist" 

  end
end

