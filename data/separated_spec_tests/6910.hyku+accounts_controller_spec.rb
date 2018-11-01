RSpec.describe Admin::AccountsController, type: :controller do
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
    { tenant: 'missing-cname', cname: '' }
  end

  context 'as an admin of a site' do
    let(:user) { FactoryBot.create(:user).tap { |u| u.add_role(:admin, Site.instance) } }
    let(:account) { FactoryBot.create(:account) }

    before do
      Site.update(account: account)
    end

    describe "GET #edit" do
      it "assigns the requested account as @account" 

    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) do
          { cname: 'new.example.com' }
        end

        it "updates the requested account" 


        it "assigns the requested account as @account" 

      end

      context "with invalid params" do
        it "assigns the account as @account" 


        it "re-renders the 'edit' template" 

      end
    end
  end
end

