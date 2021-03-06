describe ResourceSharer do
  before { allow(User).to receive_messages(:server_timezone => "UTC") }

  describe "#share" do
    subject do
      described_class.new(:user     => user,
                          :resource => resource_to_be_shared,
                          :tenants  => tenants,
                          :features => features)
    end

    let(:user) do
      FactoryGirl.create(:user,
                         :role     => "user",
                         :features => user_allowed_feature)
    end
    let(:user_allowed_feature) { "service" }
    let(:resource_to_be_shared) { FactoryGirl.create(:miq_template) }
    let(:tenants) { [FactoryGirl.create(:tenant)] }
    let(:features) { :all }

    context "with valid arguments" do
      before do
        expect(user.owned_shares.count).to eq(0)
        expect(subject).to be_valid
        subject.share
      end

      it "creates a share from the user to the tenant" 

    end

    context "product features" do
      context "with the :all option on initialization" do
        it "uses the user's current features" 

      end

      context "with an unauthorized product feature (across tree)" do
        let(:features) { MiqProductFeature.find_by(:identifier => "host") }
        let(:user_allowed_feature) { "service" }

        before { EvmSpecHelper.seed_specific_product_features(%w(host service)) }

        it "is invalid" 

      end

      context "with an unauthorized product feature (up tree)" do
        let(:features) { MiqProductFeature.find_by(:identifier => "host") }
        let(:user_allowed_feature) { "host_edit" }

        before { EvmSpecHelper.seed_specific_product_features(%w(host)) }

        it "is invalid" 

      end

      context "with a 'sees everything' product feature user" do
        let(:features) { MiqProductFeature.find_by(:identifier => "host_edit") }
        let(:user_allowed_feature) { "everything" }

        before { EvmSpecHelper.seed_specific_product_features(%w(host_edit everything)) }

        it "is valid" 

      end
    end

    context "with an invalid resource" do
      let(:resource_to_be_shared) { FactoryGirl.build(:miq_group) }

      it "is invalid" 

    end

    context "attempting to share a resource the user doesn't have access to via RBAC" do
      let(:user) do
        FactoryGirl.create(:user,
                           :role     => "user",
                           :features => user_allowed_feature,
                           :tenant   => FactoryGirl.create(:tenant, :name => "Tenant under root"))
      end
      let(:resource_to_be_shared) do
        FactoryGirl.create(:miq_template,
                           :tenant => FactoryGirl.create(:tenant,
                                                         :name => "Sibling tenant"))
      end
      let(:tenants) { [user.current_tenant] } # Attempt to share a resource in Sibling tenant to one's own tenant

      before { Tenant.seed }

      it "is invalid" 

    end

    context "with tenants that aren't tenants" do
      let(:tenants) { [FactoryGirl.build(:miq_group)] }

      it "is invalid" 

    end
  end
end

