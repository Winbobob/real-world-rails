describe "ArExtractObjects" do
  context "ArExtractObjectsTest" do
    before do
      vms = (0...2).collect { FactoryGirl.create(:vm_vmware) }
      @vm1, @vm2 = *vms
      @id1, @id2 = vms.collect(&:id)
    end

    context "calling extract_objects" do
      it "should extract single objects" 


      it "should extract multiple objects" 

    end

    context "calling extract_ids" do
      it "should extract single objects" 


      it "should extract multiple objects" 

    end
  end
end

