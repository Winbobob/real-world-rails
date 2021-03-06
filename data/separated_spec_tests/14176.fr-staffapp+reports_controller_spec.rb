require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:admin)     { create :admin_user }

  it_behaves_like 'Pundit denies access to', :index
  it_behaves_like 'Pundit denies access to', :finance_report

  context 'as an admin' do
    before { sign_in admin }

    describe 'GET #index' do
      before { get :index }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :index }
    end

    describe 'GET #finance_report' do
      before { get :finance_report }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :finance_report }

      describe 'assigns form object' do
        subject { assigns(:form) }

        it { is_expected.to be_a_kind_of Forms::FinanceReport }
      end
    end

    describe 'PUT #finance_report' do

      subject { response }

      context 'with invalid data - nil date from' do
        before { put :finance_report_generator, forms_finance_report: { date_from: nil, date_to: '2015-12-31' } }

        it { is_expected.to have_http_status(:success) }

        it { is_expected.to render_template :finance_report }
      end

      context 'with valid data - both from and to dates' do
        before { put :finance_report_generator, forms_finance_report: { date_from: '2015-01-01', date_to: '2015-12-31' } }

        it { is_expected.to have_http_status(:success) }

        it 'sets the filename' 


        it 'sets the file type' 

      end
    end

    describe 'GET #graphs' do
      before { get :graphs }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :graphs }

      it 'populates a list of report_data' 

    end

    describe 'GET #public' do
      before { get :public }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :public }
    end

    describe 'GET #letters' do
      before { get :letters }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :letters }
    end

    describe 'GET #raw_data' do
      before { get :raw_data }

      subject { response }

      it { is_expected.to have_http_status(:success) }

      it { is_expected.to render_template :raw_data }

      describe 'assigns form object' do
        subject { assigns(:form) }

        it { is_expected.to be_a_kind_of Forms::FinanceReport }
      end
    end

    describe 'PUT #raw_data' do
      subject { response }

      context 'with invalid data - nil date from' do
        before { put :raw_data_export, forms_finance_report: { date_from: nil, date_to: '2015-12-31' } }

        it { is_expected.to have_http_status(:success) }

        it { is_expected.to render_template :raw_data }
      end

      context 'with valid data - both from and to dates' do
        before { put :raw_data_export, forms_finance_report: { date_from: '2015-01-01', date_to: '2015-12-31' } }

        it { is_expected.to have_http_status(:success) }

        it 'sets the filename' 


        it 'sets the file type' 

      end
    end
  end
end

