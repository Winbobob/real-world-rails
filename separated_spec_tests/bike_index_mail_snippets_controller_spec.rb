require 'spec_helper'

describe Admin::MailSnippetsController do
  include_context :logged_in_as_super_admin

  describe 'index' do
    it 'renders without_organizations mail_snippets' 

  end

  describe 'edit' do
    context 'organization_mail_snippet' do
      let(:mail_snippet) { FactoryGirl.create(:organization_mail_snippet) }
      it 'redirects' 

    end
    context 'non organized' do
      let(:mail_snippet) { FactoryGirl.create(:mail_snippet) }
      it 'renders' 

    end
  end
end

