require 'spec_helper'

describe Admin::AccountsAndBillingSettingsController, type: :controller do
  let!(:pm1) { create(:payment_method) }
  let!(:sm1) { create(:shipping_method) }
  let!(:pm2) { create(:payment_method) }
  let!(:sm2) { create(:shipping_method) }
  let!(:accounts_distributor) { create(:distributor_enterprise, payment_methods: [pm1], shipping_methods: [sm1]) }
  let!(:new_distributor) { create(:distributor_enterprise, payment_methods: [pm2], shipping_methods: [sm2]) }
  let(:user) { create(:user) }
  let(:admin) { create(:admin_user) }

  before do
    Spree::Config.set({
      accounts_distributor_id: accounts_distributor.id,
      default_accounts_payment_method_id: pm1.id,
      default_accounts_shipping_method_id: sm1.id,
      auto_update_invoices: true,
      auto_finalize_invoices: false
    })
  end

  describe "edit" do
    context "as an enterprise user" do
      before { allow(controller).to receive(:spree_current_user) { user } }

      it "does not allow access" 

    end

    context "as super admin" do
      before { allow(controller).to receive(:spree_current_user) { admin } }

      it "loads relevant global settings into a locally dummy class" 

    end
  end

  describe "update" do
    context "as an enterprise user" do
      before { allow(controller).to receive(:spree_current_user) { user } }

      it "does not allow access" 

    end

    context "as super admin" do
      before {allow(controller).to receive(:spree_current_user) { admin } }
      let(:params) { { settings: { } } }

      context "when required settings have no values" do
        before do
          params[:settings][:accounts_distributor_id] = ''
          params[:settings][:default_accounts_payment_method_id] = '0'
          params[:settings][:default_accounts_shipping_method_id] = '0'
          params[:settings][:auto_update_invoices] = '0'
          params[:settings][:auto_finalize_invoices] = '0'
          spree_get :update, params
        end

        it "does not allow them to be empty/false" 

      end

      context "when required settings have values" do
        before do
          params[:settings][:accounts_distributor_id] = new_distributor.id
          params[:settings][:default_accounts_payment_method_id] = pm2.id
          params[:settings][:default_accounts_shipping_method_id] = sm2.id
          params[:settings][:auto_update_invoices] = '0'
          params[:settings][:auto_finalize_invoices] = '0'
        end

        it "sets global config to the specified values" 

      end
    end
  end

  describe "start_job" do
    context "as an enterprise user" do
      before do
        allow(controller).to receive(:spree_current_user) { user }
        spree_post :start_job, enterprise_id: accounts_distributor.id
      end

      it "does not allow access" 

    end

    context "as super admin" do
      before do
        allow(controller).to receive(:spree_current_user) { admin }
      end

      context "when settings are not valid" do
        before do
          Spree::Config.set({ accounts_distributor_id: "" })
          Spree::Config.set({ default_accounts_payment_method_id: "" })
          Spree::Config.set({ default_accounts_shipping_method_id: "" })
          spree_post :start_job, job: { name: "" }
        end

        it "returns immediately and renders :edit" 

      end

      context "when settings are valid" do
        before do
          Spree::Config.set({ accounts_distributor_id: accounts_distributor.id })
          Spree::Config.set({ default_accounts_payment_method_id: pm1.id })
          Spree::Config.set({ default_accounts_shipping_method_id: sm1.id })
        end

        context "and job_name is not on the known_jobs list" do
          before do
            spree_post :start_job, job: { name: "" }
          end

          it "returns immediately with an error" 

        end

        context "and job_name is update_account_invoices" do
          let!(:params) { { job: { name: "update_account_invoices" } } }

          context "and no jobs are currently running" do
            before do
              allow(controller).to receive(:load_jobs)
            end

            it "runs the job" 

          end

          context "and there are jobs currently running" do
            before do
              allow(controller).to receive(:load_jobs)
              controller.instance_variable_set("@update_account_invoices_job", double(:update_account_invoices_job))
            end

            it "does not run the job" 

          end
        end

        context "and job_name is finalize_account_invoices" do
          let!(:params) { { job: { name: "finalize_account_invoices"  } } }

          context "and no jobs are currently running" do
            before do
              allow(controller).to receive(:load_jobs)
            end

            it "runs the job" 

          end

          context "and there are jobs currently running" do
            before do
              allow(controller).to receive(:load_jobs)
              controller.instance_variable_set("@finalize_account_invoices_job", double(:finalize_account_invoices_job))
            end

            it "does not run the job" 

          end
        end
      end
    end
  end

  describe "show_methods" do
    context "as an enterprise user" do
      before do
        allow(controller).to receive(:spree_current_user) { user }
        spree_get :show_methods, enterprise_id: accounts_distributor.id
      end

      it "does not allow access" 

    end

    context "as super admin" do
      before do
        allow(controller).to receive(:spree_current_user) { admin }
        spree_get :show_methods, enterprise_id: accounts_distributor.id
      end

      it "renders the method_settings template" 

    end
  end
end

