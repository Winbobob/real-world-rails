require 'spec_helper'

RSpec.describe OrganizationsController do
  let!(:organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: organization) }
  let(:user) { member.user }

  describe 'GET #show' do
    it 'displays the organization page' 

  end

  describe 'GET #index' do
    it 'populates and array of organizations' 

  end

  describe 'POST #create' do
    it 'only superdamins are authorized create to new organizations' 

  end

  describe 'POST #update' do
    context 'with a logged user (admins organization)' do
      let(:member) { Fabricate(:member, organization: organization, manager: true) }

      it 'allows to update organization' 

    end

    context 'without a logged user' do
      it 'does not allow to update organization' 

    end
  end

  describe '#set_current' do
    before { login(user) }

    it 'stores the given organization as current organization in session' 

  end
end

