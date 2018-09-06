require "spec_helper"

feature %q{
    As a Super Admin
    I want to be able to set a distributor on each payment method
} do
  include AuthenticationWorkflow
  include WebHelper

  background do
    @distributors = (1..3).map { create(:distributor_enterprise) }
  end

  describe "creating a payment method", js: true do
    scenario "assigning a distributor to the payment method" do
      login_to_admin_section

      click_link 'Configuration'
      click_link 'Payment Methods'
      click_link 'New Payment Method'

      fill_in 'payment_method_name', :with => 'Cheque payment method'

      check "payment_method_distributor_ids_#{@distributors[0].id}"
      click_button 'Create'

      flash_message.should == 'Payment Method has been successfully created!'

      payment_method = Spree::PaymentMethod.find_by_name('Cheque payment method')
      payment_method.distributors.should == [@distributors[0]]
    end

    context "using stripe connect" do
      let(:user) { create(:user, enterprise_limit: 5) }
      let!(:connected_enterprise) { create(:distributor_enterprise, name: "Connected", owner: user) }
      let!(:revoked_account_enterprise) { create(:distributor_enterprise, name: "Revoked", owner: user) }
      let!(:missing_account_enterprise) { create(:distributor_enterprise, name: "Missing", owner: user) }
      let!(:valid_stripe_account) { create(:stripe_account, enterprise: connected_enterprise, stripe_user_id: "acc_connected123") }
      let!(:disconnected_stripe_account) { create(:stripe_account, enterprise: revoked_account_enterprise, stripe_user_id: "acc_revoked123") }
      let!(:stripe_account_mock) { { id: "acc_connected123", business_name: "My Org", charges_enabled: true } }

      before do
        Spree::Config.set(stripe_connect_enabled: true)
        allow(Stripe).to receive(:api_key) { "sk_test_12345" }
        stub_request(:get, "https://api.stripe.com/v1/accounts/acc_connected123").to_return(body: JSON.generate(stripe_account_mock))
        stub_request(:get, "https://api.stripe.com/v1/accounts/acc_revoked123").to_return(status: 404)
      end

      it "communicates the status of the stripe connection to the user" 

    end
  end

  scenario "updating a payment method", js: true do
    pm = create(:payment_method, distributors: [@distributors[0]])
    login_to_admin_section

    visit spree.edit_admin_payment_method_path pm

    fill_in 'payment_method_name', :with => 'New PM Name'
    find(:css, "tags-input .tags input").set "member\n"

    uncheck "payment_method_distributor_ids_#{@distributors[0].id}"
    check "payment_method_distributor_ids_#{@distributors[1].id}"
    check "payment_method_distributor_ids_#{@distributors[2].id}"
    select2_select "PayPal Express", from: "payment_method_type"
    expect(page).to have_field 'Login'
    fill_in 'payment_method_preferred_login', with: 'testlogin'
    fill_in 'payment_method_preferred_password', with: 'secret'
    fill_in 'payment_method_preferred_signature', with: 'sig'

    click_button 'Update'

    expect(flash_message).to eq 'Payment Method has been successfully updated!'

    expect(first('tags-input .tag-list ti-tag-item')).to have_content "member"

    payment_method = Spree::PaymentMethod.find_by_name('New PM Name')
    expect(payment_method.distributors).to include @distributors[1], @distributors[2]
    expect(payment_method.distributors).not_to include @distributors[0]
    expect(payment_method.type).to eq "Spree::Gateway::PayPalExpress"
    expect(payment_method.preferences[:login]).to eq 'testlogin'
    expect(payment_method.preferences[:password]).to eq 'secret'
    expect(payment_method.preferences[:signature]).to eq 'sig'

    fill_in 'payment_method_preferred_login', with: 'otherlogin'
    click_button 'Update'

    expect(flash_message).to eq 'Payment Method has been successfully updated!'
    expect(page).to have_field 'Password', with: ''
    expect(first('tags-input .tag-list ti-tag-item')).to have_content "member"

    payment_method = Spree::PaymentMethod.find_by_name('New PM Name')
    expect(payment_method.tag_list).to eq ["member"]
    expect(payment_method.preferences[:login]).to eq 'otherlogin'
    expect(payment_method.preferences[:password]).to eq 'secret'
    expect(payment_method.preferences[:signature]).to eq 'sig'
  end

  context "as an enterprise user", js: true do
    let(:enterprise_user) { create_enterprise_user }
    let(:distributor1) { create(:distributor_enterprise, name: 'First Distributor') }
    let(:distributor2) { create(:distributor_enterprise, name: 'Second Distributor') }
    let(:distributor3) { create(:distributor_enterprise, name: 'Third Distributor') }
    let(:pm1) { create(:payment_method, name: 'One', distributors: [distributor1]) }
    let(:pm2) { create(:payment_method, name: 'Two', distributors: [distributor1, distributor2]) }
    let(:pm3) { create(:payment_method, name: 'Three', distributors: [distributor3]) }

    before(:each) do
      enterprise_user.enterprise_roles.build(enterprise: distributor1).save
      enterprise_user.enterprise_roles.build(enterprise: distributor2).save
      login_to_admin_as enterprise_user
    end

    it "I can get to the new enterprise page" 


    it "creates payment methods" 


    it "shows me only payment methods I have access to" 


    it "does not show duplicates of payment methods" 



    pending "shows me only payment methods for the enterprise I select" do
      pm1
      pm2

      click_link 'Enterprises'
      within("#e_#{distributor1.id}") { click_link 'Manage' }
      within(".side_menu") do
        click_link "Payment Methods"
      end

      page.should     have_content pm1.name
      page.should     have_content pm2.name

      click_link 'Enterprises'
      within("#e_#{distributor2.id}") { click_link 'Manage' }
      within(".side_menu") do
        click_link "Payment Methods"
      end

      page.should_not have_content pm1.name
      page.should     have_content pm2.name
    end
  end
end

