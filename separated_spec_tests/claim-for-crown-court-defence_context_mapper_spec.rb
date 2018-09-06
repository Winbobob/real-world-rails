require 'rails_helper'

RSpec.describe Claims::ContextMapper do

  # NOTE: the external user claim controller spec also test this to a degree
  #

  describe '#available_claim_types' do
    let(:external_user) { create(:external_user, :advocate_litigator) }
    let(:advocate)      { create(:external_user, :advocate) }
    let(:litigator)     { create(:external_user, :litigator) }

    context 'when the AGFS fee reform feature flag is NOT active' do
      before do
        allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(false)
      end

      it 'should return advocate claims for users in AGFS only provider' 


      it 'should return litigator claims for users in LGFS only provider' 


      context 'AGFS and LGFS providers' do

        it 'should return litigator claim for a litigators' 


        it 'should return litigator and advocate claim for a litigator admins' 


        it 'should return advocate claim for a advocates' 


        it 'should return advocate and litigator claim for a advocate admins' 


        it 'should return advocate AND litigator claims for a admins' 


        it 'should return advocate AND litigator claims for users with admin, litigator and advocate roles' 

      end
    end

    context 'when the AGFS fee reform feature flag is active' do
      before do
        allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(true)
      end

      it 'should return advocate claims for users in AGFS only provider' 


      it 'should return litigator claims for users in LGFS only provider' 


      context 'AGFS and LGFS providers' do

        it 'should return litigator claim for a litigators' 


        it 'should return litigator and advocate claim for a litigator admins' 


        it 'should return advocate claim for a advocates' 


        it 'should return advocate and litigator claim for a advocate admins' 


        it 'should return advocate AND litigator claims for a admins' 


        it 'should return advocate AND litigator claims for users with admin, litigator and advocate roles' 

      end
    end
  end

  describe '#available_schemes' do
    let(:external_user) { create(:external_user, :advocate_litigator) }
    let(:advocate) { create(:external_user, :advocate) }
    let(:litigator) { create(:external_user, :litigator) }

    it 'for users in AGFS only provider' 


    it 'for users in LGFS only provider' 


    context 'AGFS and LGFS providers' do
      [
        [%w(advocate),                  [:agfs]],
        [%w(litigator),                 [:lgfs]],
        [%w(admin),                     [:agfs, :lgfs]],
        [%w(litigator admin),           [:agfs, :lgfs]],
        [%w(advocate admin),            [:agfs, :lgfs]],
        [%w(admin advocate litigator),  [:agfs, :lgfs]],
      ].each do |(roles, schemes)|
        it "returns the schemes #{schemes} for roles #{roles}" 

      end
    end
  end

  describe '#available_claims' do

    before(:all) do
      @agfs_provider    = create :provider, :agfs
      @lgfs_provider    = create :provider, :lgfs
      @both_provider    = create :provider, :agfs_lgfs
      @advocate         = create(:external_user, :advocate, provider: @agfs_provider)
      @advocate_admin   = create(:external_user, :advocate_and_admin, provider: @agfs_provider)
      @litigator        = create(:external_user, :litigator, provider: @lgfs_provider)
      @litigator_admin  = create(:external_user, :litigator_and_admin, provider: @lgfs_provider)
      @agfs_lgfs_admin  = create(:external_user, :advocate_litigator, provider: @both_provider)
      @other_litigator  = create(:external_user, :litigator, provider: @lgfs_provider)
    end

    after(:all) do
      clean_database
    end

    context 'AGFS' do
      before do
        create_list(:advocate_claim, 2, external_user: @advocate)
        create_list(:advocate_claim, 1, external_user: @advocate_admin)
      end

      it 'advocate context should return all claims owned by the advocate' 


      it 'advocate admin context should return all claims owned by the provider' 

    end

    context 'LGFS' do
      before do
        create_list(:litigator_claim, 2, external_user: @litigator, creator: @litigator)
        create_list(:litigator_claim, 1, external_user: @litigator, creator: @litigator_admin)
        create_list(:litigator_claim, 1, external_user: @other_litigator, creator: @litigator_admin)
      end

      it 'litigator context should return all claims owned by the external user' 


      it 'litigator admin context should return all claims created by members of the provider' 

    end
  end

  context 'AGFS/LGFS' do

    before(:all) do
      @provider    = create :provider, :agfs_lgfs
      @litigator_1 = create :external_user, :litigator, provider: @provider
      @litigator_2 = create :external_user, :litigator, provider: @provider
      @advocate_1  = create :external_user, :advocate, provider: @provider
      @advocate_2  = create :external_user, :advocate, provider: @provider
      @claim_l1    = create :litigator_claim, external_user: @litigator_1, creator: @litigator_1
      @claim_l2    = create :litigator_claim, external_user: @litigator_2, creator: @litigator_2
      @claim_a1    = create :advocate_claim, external_user: @advocate_1, creator: @advocate_1
      @claim_a2    = create :advocate_claim, external_user: @advocate_2, creator: @advocate_2
      @admin       = create(:external_user, :agfs_lgfs_admin, provider: @provider)
    end

    after(:all) do
      clean_database
    end

    it 'returns all claims for the provider for the admin context' 


    it 'returns all claims for the external user' 


    context 'for AGFS scheme filter' do
      let(:options) { {scheme: :agfs} }

      it 'returns all AGFS claims for the provider for the admin context' 


      it 'returns all AGFS claims for the external user' 

    end

    context 'for LGFS scheme filter' do
      let(:options) { {scheme: :lgfs} }

      it 'returns all LGFS claims for the provider for the admin context' 


      it 'returns all LGFS claims for the external user' 

    end
  end
end
