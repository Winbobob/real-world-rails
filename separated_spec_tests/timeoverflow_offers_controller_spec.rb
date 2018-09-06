require "spec_helper"

describe OffersController, type: :controller do
  let(:test_organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: test_organization) }
  let(:another_member) { Fabricate(:member, organization: test_organization) }
  let(:yet_another_member) { Fabricate(:member) }
  let(:test_category) { Fabricate(:category) }
  let!(:offer) do
    Fabricate(:offer,
              user: member.user,
              organization: test_organization,
              category: test_category)
  end

  include_context "stub browser locale"

  before { set_browser_locale("ca") }

  describe "GET #index" do
    context "with a logged user" do
      it "populates an array of offers" 

    end
    context "with another organization" do
      it "skips the original org's offers" 

    end
  end

  describe "GET #index (search)" do
    before do
      Offer.__elasticsearch__.create_index!(force: true)

      # Import any already existing model into the index
      # for instance the ones that have been created in upper
      # `let!` or `before` blocks
      Offer.__elasticsearch__.import(force: true, refresh: true)
    end

    it "populates an array of offers" 

  end

  describe "GET #show" do
    context "with valid params" do
      context "with a logged user" do
        before { login(another_member.user) }

        it "assigns the requested offer to @offer" 


        it 'assigns the account destination of the transfer' 

      end

      context "without a logged in user" do
        it "assigns the requested offer to @offer" 

      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      context "with a logged user" do
        it "creates a new offer" 

      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      context "with a logged user" do
        it "located the requested @offer" 


        it "changes @offer's attributes" 

      end
    end

    context "with invalid params" do
      context "with a logged user" do
        it "does not change @offer's attributes" 

      end
    end
  end

  describe "DELETE destroy" do
    it "toggle active field" 


    it "redirects to offers#index" 

  end
end

