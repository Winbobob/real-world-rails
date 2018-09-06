describe ActsAsTaggable do
  before do
    @host1 = FactoryGirl.create(:host, :name => "HOST1")
    @host1.tag_with("red blue yellow", :ns => "/test", :cat => "tags")
    @host2 = FactoryGirl.create(:host, :name => "HOST2")
    @host3 = FactoryGirl.create(:host, :name => "HOST3")

    @vm1   = FactoryGirl.create(:vm_vmware, :name => "VM1")
    @vm2   = FactoryGirl.create(:vm_vmware, :name => "VM2")
    @vm3   = FactoryGirl.create(:vm_vmware, :name => "VM3")
    @vm4   = FactoryGirl.create(:vm_vmware, :name => "VM4")

    @vm1.tag_with("red blue yellow", :ns => "/test", :cat => "tags")
    @vm3.tag_with("Red Blue Yellow", :ns => "/Test", :cat => "MixedCase")
    @vm4.tag_with("nyc chi la", :cat => "someuser")
    @vm4.tag_add("bos phi blt")
  end

  describe '#writable_classification_tags' do
    let(:parent_classification) { FactoryGirl.create(:classification, :description => "Environment", :name => "environment", :read_only => false) }
    let(:classification)        { FactoryGirl.create(:classification, :name => "prod", :description => "Production", :parent => parent_classification, :read_only => true) }

    before do
      classification.assign_entry_to(@vm1)
    end

    it "returns only tags as they would be entered in UI by user(edit tags screen)" 

  end

  context ".find_tagged_with" do
    it ":any" 


    it ":all" 


    it "STI classes" 


    it "with namespace specified" 

  end

  it "#tags" 


  context "#tag_with" do
    it "passing string" 


    it "passing array" 


    context "can remove tags" do
      before do
        @vm2.tag_with("red", :ns => "/test", :cat => "my_zone")
        @vm2.tag_with("low", :ns => "/test", :cat => "my_zone_cost")
      end

      it "should remove tags from the category" 


      it "should not remove tags from other category" 

    end
  end

  it "#tag_add" 


  context "#tag_remove" do
    it "works" 


    it "does nothing if tag doesn't exist" 

  end

  context "#is_tagged_with?" do
    it "works" 


    it "works with mixed case" 


    it "with namespace specified" 


    it "with virtual reflections" 

  end

  it "#tag_list" 


  it "#to_tag" 

end

