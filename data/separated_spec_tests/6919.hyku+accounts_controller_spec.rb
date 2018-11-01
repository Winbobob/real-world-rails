RSpec.describe Proprietor::AccountsController, type: :controller, multitenant: true do
  let(:user) {}

  before do
    sign_in user if user
  end

  # This should return the minimal set of attributes required to create a valid
  # Account. As you add validations to Account, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'x' }
  end

  let(:valid_fcrepo_endpoint_attributes) do
    { url: 'http://127.0.0.1:8984/go',
      base_path: '/dev' }
  end

  let(:invalid_attributes) do
    { tenant: 'missing-cname', cname: '' }
  end

  context 'as an anonymous user' do
    describe "GET #new" do
      it "is unauthorized" 

    end

    describe "POST #create" do
      context "with valid params" do
        it "is unauthorized" 

      end
    end
  end

  context 'as an admin of a site' do
    let(:user) { FactoryBot.create(:user).tap { |u| u.add_role(:admin, Site.instance) } }
    let(:account) { FactoryBot.create(:account) }

    before do
      Site.update(account: account)
    end

    describe "GET #index" do
      it "is unauthorized" 

    end

    describe "GET #show" do
      it "assigns the requested account as @account" 

    end

    describe "GET #edit" do
      it "assigns the requested account as @account" 

    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) do
          { cname: 'new.example.com',
            fcrepo_endpoint_attributes: valid_fcrepo_endpoint_attributes,
            admin_emails: ['test@test.com', 'me@myhouse.com'] }
        end

        it "updates the requested account" 


        it "assigns the requested account as @account" 

      end

      context "with invalid params" do
        it "assigns the account as @account" 


        it "re-renders the 'edit' template" 

      end
    end

    describe "DELETE #destroy" do
      it "denies the request" 

    end

    context 'editing another tenants account' do
      let(:another_account) { FactoryBot.create(:account) }

      describe "GET #show" do
        it "denies the request" 

      end

      describe "GET #edit" do
        it "denies the request" 

      end

      describe "PUT #update" do
        it "denies the request" 

      end
    end
  end

  context 'as a superadmin' do
    let(:user) { FactoryBot.create(:superadmin) }
    let!(:account) { FactoryBot.create(:account) }

    describe "GET #index" do
      it "assigns all accounts as @accounts" 

    end

    describe "GET #show" do
      it "assigns the requested account as @account" 

    end

    describe "DELETE #destroy" do
      it "destroys the requested account" 


      it "redirects to the accounts list" 

    end
  end

  describe 'account dependency switching' do
    let(:account) { FactoryBot.create(:account) }

    before do
      Site.update(account: account)
      allow(controller).to receive(:current_account).and_return(account)
    end

    it 'switches account information' 

  end
end

