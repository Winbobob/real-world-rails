require 'rails_helper'

describe "seeds/show" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @seed = FactoryBot.create(:seed)
    assign(:seed, @seed)
    assign(:photos, @seed.photos.paginate(page: 1))
  end

  it "renders attributes in <p>" 


  context "tradable" do
    before(:each) do
      @owner = FactoryBot.create(:london_member)
      assign(:seed, FactoryBot.create(:tradable_seed,
        owner: @owner))
      # note current_member is not the owner of this seed
      @member = FactoryBot.create(:member)
      sign_in @member
      controller.stub(:current_user) { @member }
    end

    it "shows tradable attributes" 


    it "shows location of seed owner" 


    context 'with no location' do
      before(:each) do
        @owner = FactoryBot.create(:member) # no location
        sign_in @owner
        controller.stub(:current_user) { @owner }
        assign(:seed, FactoryBot.create(:tradable_seed, owner: @owner))
      end

      it 'says "from unspecified location"' 


      it "links to profile to set location" 

    end

    it "shows button to send message" 

  end
end

