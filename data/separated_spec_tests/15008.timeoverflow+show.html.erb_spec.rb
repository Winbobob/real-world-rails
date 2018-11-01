require 'spec_helper'

RSpec.describe 'organizations/show' do
  let(:organization) { Fabricate(:organization) }

  before do
    allow(view).to receive(:admin?).and_return(false)
    allow(view).to receive(:superadmin?).and_return(false)

    assign :organization, organization
  end

  context 'without a logged user' do
    before do
      allow(view).to receive(:current_user).and_return(nil)

      assign :movements, []
      render template: 'organizations/show'
    end

    it 'does not display link to new_transfer_path' 


    it 'does not display the movements section' 

  end

  context 'with a logged user (organization member)' do
    let(:member) { Fabricate(:member, organization: organization) }
    let(:user) { member.user }

    before do
      allow(view).to receive(:current_user).and_return(user)

      assign :movements, Movement.page
      render template: 'organizations/show'
    end

    it 'links to new_transfer_path' 


    it 'diplays the movements section' 

  end
end

