# encoding: utf-8

# EXEMPLAR

describe "/content_partners" do
  before(:all) do
    populate_tables(:data_types, :special_collection, :content_partner_statuses,
                    :licenses)
  end

  context "when not logged" do
    let(:content_partner) { create(:content_partner) }

    it "renders index" 


    it "renders show" 


    it "renders new" 


    it "renders edit" 

  end

  context "when logged" do
    before(:each) do
      login_as user
    end

    let(:content_partner) { create(:content_partner) }
    let(:user) { User.gen }

    it "renders index" 


    it "renders show" 


    it "renders new" 


    it "renders edit" 


    it "creates content_partner, signs agreement" 


    it "does not create partner with a problem" 


    context "has content_partner" do
      let(:content_partner) do
        cp = ContentPartner.gen(user: user)
        ContentPartnerAgreement.gen(content_partner: cp,
                                    signed_on_date: 1.day.ago)
        cp
      end

      it "renders edit" 


      context "no resources" do
        it "edits, updates, goes to add resource" 

      end

      context "with resources" do
        let!(:resource) do
          rs = Resource.gen(content_partner: content_partner)
          rs
        end

        it "updates and redirects to content_partner list" 

      end

    end
  end
end

