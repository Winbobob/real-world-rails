require 'spec_helper'

describe Spree::Admin::PaymentMethodsController, type: :controller do
  describe "#update" do
    context "on a StripeConnect payment method" do
      let!(:user) { create(:user, enterprise_limit: 2) }
      let!(:enterprise1) { create(:distributor_enterprise, owner: user) }
      let!(:enterprise2) { create(:distributor_enterprise, owner: create(:user)) }
      let!(:payment_method) { create(:stripe_payment_method, distributor_ids: [enterprise1.id, enterprise2.id], preferred_enterprise_id: enterprise2.id) }

      before { allow(controller).to receive(:spree_current_user) { user } }

      context "when an attempt is made to change the stripe account holder (preferred_enterprise_id)" do
        let(:params) { { id: payment_method.id, payment_method: { type: "Spree::Gateway::StripeConnect", preferred_enterprise_id: enterprise1.id } } }

        context "as a user that does not manage the existing stripe account holder" do
          it "prevents the stripe account holder from being updated" 

        end

        context "as a user that manages the existing stripe account holder" do
          before { enterprise2.update_attributes!(owner_id: user.id) }

          it "allows the stripe account holder to be updated" 


          context "when no enterprise is selected as the account holder" do
            before { payment_method.update_attribute(:preferred_enterprise_id, nil) }

            context "id not provided at all" do
              before { params[:payment_method].delete(:preferred_enterprise_id) }

              it "does not save the payment method" 

            end

            context "enterprise_id of 0" do
              before { params[:payment_method][:preferred_enterprise_id] = 0 }

              it "does not save the payment method" 

            end
          end
        end
      end
    end
  end

  context "Requesting provider preference fields" do
    let(:enterprise) { create(:distributor_enterprise) }
    let(:user) do
      new_user = create(:user, email: 'enterprise@hub.com', password: 'blahblah', :password_confirmation => 'blahblah', )
      new_user.spree_roles = [] # for some reason unbeknown to me, this new user gets admin permissions by default.
      new_user.enterprise_roles.build(enterprise: enterprise).save
      new_user.save
      new_user
    end

    before do
      controller.stub spree_current_user: user
    end

    context "on an existing payment method" do
      let(:payment_method) { create(:payment_method) }

      context "where I have permission" do
        before do
          payment_method.distributors << user.enterprises.is_distributor.first
        end

        context "without an altered provider type" do
          it "renders provider settings with same payment method" 

        end

        context "with an altered provider type" do
          it "renders provider settings with a different payment method" 

        end
      end

      context "where I do not have permission" do
        before do
          payment_method.distributors = []
        end

        it "renders unauthorised" 

      end
    end

    context "on a new payment method" do
      it "renders provider settings with a new payment method of type" 

    end
  end
end

