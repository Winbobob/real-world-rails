require 'spec_helper'

describe Admin::DashboardController do
  describe 'index' do
    context 'logged in as admin' do
      include_context :logged_in_as_super_admin
      it 'renders' 

    end
    context 'not logged in' do
      it 'redirects' 

    end
    context 'non-admin' do
      include_context :logged_in_as_organization_admin
      it 'redirects' 

    end
    context 'logged in as content admin' do
      it 'redirects' 

    end
  end

  context 'logged in as admin' do
    include_context :logged_in_as_super_admin
    describe 'invitations' do
      it 'renders' 

    end

    describe 'maintenance' do
      it 'renders' 

    end

    describe 'tsvs' do
      it 'renders and assigns tsvs' 

    end

    describe 'update_tsv_blacklist' do
      it 'renders and updates' 

    end
  end
end

