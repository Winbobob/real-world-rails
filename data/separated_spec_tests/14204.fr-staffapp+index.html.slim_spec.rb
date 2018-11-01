require 'rails_helper'

RSpec.describe "home/index.html.slim", type: :view do
  module DwpMaintenanceHelper
    def dwp_maintenance?; end
  end

  subject { rendered }

  let(:office) { create :office }
  let(:user) { create :user, office: office }

  let(:dwp_maintenance) { false }
  let(:application_new?) { false }
  let(:application_index?) { false }
  let(:report_graphs?) { false }
  let(:report_index?) { false }
  let(:office_index?) { false }
  let(:dwp_state) { 'online' }

  before do
    allow(view).to receive(:policy).with(:application).and_return(instance_double(ApplicationPolicy, new?: application_new?, index?: application_index?))
    allow(view).to receive(:policy).with(:report).and_return(instance_double(ReportPolicy, index?: report_index?, graphs?: report_graphs?))
    allow(view).to receive(:policy).with(:office).and_return(instance_double(OfficePolicy, index?: office_index?))
    view.extend(DwpMaintenanceHelper)
    allow(view).to receive(:dwp_maintenance?).and_return(dwp_maintenance)

    sign_in user
    assign(:state, dwp_state)
    assign(:online_search_form, instance_double(Forms::Search, errors: {}, reference: nil))
    assign(:completed_search_form, instance_double(Forms::Search, errors: {}, reference: nil))
    render
  end

  describe 'Generate reports box' do
    context 'when user has permissions to generate reports' do
      let(:report_index?) { true }

      it 'is rendered' 

    end

    context 'when user does not have permissions to generate reports' do
      it 'are not rendered' 

    end
  end

  describe 'View offices box' do
    context 'when user has permissions to list offices' do
      let(:office_index?) { true }

      it 'is rendered' 

    end

    context 'when user does not have permissions to list offices' do
      it 'are not rendered' 

    end
  end

  describe 'Process application box' do
    context 'when user has permissions to process application' do
      let(:application_new?) { true }

      it 'renders title' 


      context 'when the office has some jurisdictions assigned' do
        it 'renders the Start now button' 

      end

      context 'when the office has no jurisdictions assigned' do
        let(:office) { create :office, jurisdictions: [] }

        it 'renders the message that manager has to first assign jurisdictions' 

      end
    end

    context 'when user does not have permissions to process application' do
      it 'is not rendered' 

    end
  end

  describe 'Process an online application box' do
    it 'is rendered' 

  end

  describe 'Waiting applications' do
    context 'when user has permissions to list applications' do
      let(:application_index?) { true }

      it 'are rendered' 

    end
    context 'when user does not have permissions to list applications' do
      it 'are not rendered' 

    end
  end

  describe 'Processed and deleted applications' do
    context 'when user has permissions to list applications' do
      let(:application_index?) { true }

      it 'are rendered' 

    end

    context 'when user does not have permissions to list applications' do
      it 'are not rendered' 

    end
  end

  describe 'Usage graphs' do
    context 'when user has permissions to see the graphs' do
      let(:report_graphs?) { true }

      it 'are rendered' 

    end

    context 'when user does not have permissions to see the graphs' do
      it 'are not rendered' 

    end
  end

  describe 'DWP banner' do
    context 'when the dwp maintenance is off' do
      context 'and user can process paper application' do
        let(:application_new?) { true }

        context 'when the service is online' do
          it { is_expected.to have_content I18n.t('error_messages.dwp_restored') }

          it { is_expected.not_to have_content 'You can only process:' }

          it { is_expected.not_to have_content 'Please wait until the DWP checker is available to process online applications' }

          it { is_expected.to have_xpath('//input[@value="Look up" and @name="commit"][not(@disabled)]') }

          it { is_expected.to have_xpath('//input[@id="online_search_reference"][not(@disabled)]') }
        end

        context 'when the service is failing or restoring' do
          let(:dwp_state) { 'warning' }

          it { is_expected.to have_content I18n.t('error_messages.dwp_warning') }

          it { is_expected.not_to have_content 'You can only process:' }

          it { is_expected.not_to have_content 'Please wait until the DWP checker is available to process online applications' }

          it { is_expected.to have_xpath('//input[@value="Look up" and @name="commit"][not(@disabled)]') }

          it { is_expected.to have_xpath('//input[@id="online_search_reference"][not(@disabled)]') }
        end

        context 'when the service is offline' do
          let(:dwp_state) { 'offline' }

          it { is_expected.to have_content I18n.t('error_messages.dwp_unavailable') }

          it { is_expected.to have_content 'You can only process:' }

          it { is_expected.to have_content 'Please wait until the DWP checker is available to process online applications' }

          it { is_expected.to have_xpath('//input[@value="Look up" and @name="commit" and @disabled]') }

          it { is_expected.to have_xpath('//input[@id="online_search_reference" and @disabled]') }
        end
      end
    end

    context 'when the dwp maintenance is on' do
      let(:dwp_maintenance) { true }

      it { is_expected.to have_content I18n.t('error_messages.dwp_maintenance') }
    end
  end
end

