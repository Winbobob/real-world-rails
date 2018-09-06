require 'rails_helper'

RSpec.describe FeedbackController, type: :controller do
  describe "GET #new" do
    let(:params) { {} }

    before { get :new, params: params }

    it 'assigns a new @feedback' 


    it "returns http success" 


    context 'feedback' do
      let(:params) { { type: 'feedback' } }

      it "renders the feedback template" 

    end

    context 'bug report' do
      let(:params) { { type: 'bug_report' } }

      it "renders the bug report template" 

    end
  end

  describe "POST #create" do
    before do
      allow(ZendeskAPI::Ticket).to receive(:create!).and_return(true)
    end

    context 'feedback' do
      let(:params) do
        { type: 'feedback', rating: '3' }
      end

      context 'when valid' do
        context 'and user signed in' do
          let(:advocate) { create(:external_user) }

          before do
            sign_in advocate.user
          end

          it "redirects to the users home" 

        end

        context 'and no user signed in' do
          it "redirects to the sign in page" 

        end

        it 'calls the GoogleAnalytics::Api' 

      end

      context 'when invalid' do
        let(:params) do
          { type: 'feedback', rating: nil }
        end

        it "renders the new template" 

      end
    end

    context 'bug report' do
      let(:params) do
        { type: 'bug_report', case_number: 'XXXX', event: 'lorem', outcome: 'ipsum' }
      end

      context 'when valid' do
        context 'and user signed in' do
          let(:advocate) { create(:external_user) }

          before do
            sign_in advocate.user
          end

          it "redirects to the users home" 

        end

        context 'and no user signed in' do
          it "redirects to the sign in page" 

        end
      end

      context 'when invalid' do
        let(:params) do
          { type: 'bug_report', event: nil }
        end

        it "renders the new template" 

      end
    end
  end
end

