RSpec.describe AccountSignUpController, type: :controller do
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

  let(:invalid_attributes) do
    { tenant: 'missing-names', cname: '' }
  end

  context 'with access' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(false)
    end
    describe "GET #new" do
      it "assigns a new account as @account" 

    end

    describe "POST #create" do
      context "with valid params" do
        before do
          allow_any_instance_of(CreateAccount).to receive(:create_external_resources)
        end

        it "creates a new Account, but not a duplicate" 

      end

      context "with invalid params" do
        it "assigns a newly created but unsaved account as @account" 


        it "re-renders the 'new' template" 

      end
    end
  end

  context 'without access' do
    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(true)
    end
    describe "GET #new" do
      it "redirects to sign in" 

    end
    describe "POST #create" do
      it "redirects to sign in" 

    end
  end

  context 'as admin with restricted access' do
    let(:user) { FactoryGirl.create(:admin) }

    before do
      allow(Settings.multitenancy).to receive(:admin_only_tenant_creation).and_return(true)
    end
    describe "GET #new" do
      it "assigns a new account as @account" 

    end
    describe "POST #create" do
      before do
        allow_any_instance_of(CreateAccount).to receive(:create_external_resources)
      end
      it "creates a new Account" 

    end
  end
end

