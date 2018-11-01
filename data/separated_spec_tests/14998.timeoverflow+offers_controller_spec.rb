require "spec_helper"

RSpec.describe OffersController, type: :controller do
  let(:organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: organization) }
  let(:another_member) { Fabricate(:member, organization: organization) }
  let(:yet_another_member) { Fabricate(:member) }
  let(:test_category) { Fabricate(:category) }
  let!(:offer) do
    Fabricate(:offer,
              user: member.user,
              organization: organization,
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

  describe 'GET #show' do
    context 'when the user is logged in' do
      before { login(another_member.user) }

      context 'when the requested offer' do
        context 'is not active' do
          before do
            offer.active = false
            offer.save!
          end

          it 'renders the 404 page' 

        end

        context 'is active' do
          context 'and the user that created the offer is not active anymore' do
            before do
              member.active = false
              member.save!
            end

            it 'renders the 404 page' 

          end

          context 'and the user that created the offer is active' do
            it 'renders a successful response' 


            it 'assigns the requested offer to @offer' 


            it 'assigns the account destination of the transfer' 


            it 'displays the offer\'s user details' 

          end
        end
      end

      context 'when the user pertains to multiple organizations' do
        context 'and user\'s current organization is different than offer\'s organization' do
          let(:another_organization) { Fabricate(:organization) }

          before do
            Fabricate(:member, user: another_member.user, organization: another_organization)
            allow(controller).to receive(:@current_organization).and_return(another_organization)
          end

          it 'displays the offer\'s user details' 


          it 'sets the offer\'s organization as user\'s current organization' 

        end
      end
    end

    context 'when the user is not a member of the organization where the offer is published' do
      let(:another_user) { Fabricate(:user) }

      before { login(another_user) }

      it 'doesn\'t display the offer\'s user details' 

    end

    context 'when the user is not logged in' do
      it 'assigns the requested offer to @offer' 


      it 'doesn\'t display the offer\'s user details' 

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

