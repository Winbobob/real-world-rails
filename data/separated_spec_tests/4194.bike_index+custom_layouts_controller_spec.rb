require 'spec_helper'

describe Admin::Organizations::CustomLayoutsController, type: :controller do
  let(:organization) { FactoryGirl.create(:organization) }
  context 'super admin' do
    include_context :logged_in_as_super_admin

    describe 'index' do
      it 'redirects' 

    end
  end

  context 'super admin and developer' do
    let(:user) { FactoryGirl.create(:admin, developer: true) }
    before do
      set_current_user(user)
    end

    describe 'index' do
      it 'renders' 

    end

    describe 'edit' do
      context 'landing_page' do
        it 'renders' 

      end
      describe 'mail_snippets' do
        MailSnippet.organization_snippet_types.each do |snippet_name|
          context snippet_name do
            it 'renders' 

          end
        end
      end
    end

    describe 'organization update' do
      context 'landing_page' do
        let(:update_attributes) { { landing_html: '<p>html for the landing page</p>' } }
        it 'updates and redirects to the landing_page edit' 

      end
      context 'mail_snippet' do
        let(:snippet_type) { MailSnippet.organization_snippet_types.last }
        let(:mail_snippet) do
          FactoryGirl.create(:organization_mail_snippet,
                             organization: organization,
                             name: snippet_type,
                             is_enabled: false)
        end
        let(:update_attributes) do
          {
            mail_snippets_attributes: {
              '0' => {
                id: mail_snippet.id,
                name: 'CRAZZY new name', # ignore
                body: '<p>html for snippet 1</p>',
                organization_id: 844, # Ignore
                is_enabled: true
              }
            }
          }
        end
        it 'updates the mail snippets' 

      end
    end
  end
end

