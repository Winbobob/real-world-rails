require 'spec_helper'

describe RegistrationsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:auto_user) { FactoryGirl.create(:organization_auto_user) }
  let(:organization) { auto_user.organizations.first }
  let(:renders_embed_without_xframe) do
    expect(response.status).to eq(200)
    expect(response).to render_with_layout('reg_embed')
    expect(response.headers['X-Frame-Options']).not_to be_present
    expect(flash).to_not be_present
  end
  describe 'new' do
    it 'renders with the embeded form, no xframing' 

  end
  describe 'embed' do
    let(:expect_it_to_render_correctly) do
      renders_embed_without_xframe
      expect(response).to render_template(:embed)
    end
    context 'no organization' do
      context 'no user' do
        it 'renders' 

      end
      context 'with user' do
        it 'renders does not set creator' 

      end
    end
    context 'with organization' do
      context 'no user' do
        it 'renders' 

      end
      context 'with user' do
        let!(:organization_child) { FactoryGirl.create(:organization, parent_organization_id: organization.id) }
        it 'renders, testing variables' 

      end
    end
  end
  describe 'create' do
    let(:manufacturer) { FactoryGirl.create(:manufacturer) }
    let(:color) { FactoryGirl.create(:color) }
    context 'invalid creation' do
      context 'email not set, sets simple_header' do
        it 'does not create a bparam, rerenders new with all assigned values' 

      end
    end
    context 'valid creation' do
      let(:expect_it_to_render_correctly) do
        renders_embed_without_xframe
        expect(response).to render_template(:create)
      end
      context 'nothing except email set' do
        it 'creates a new bparam and renders' 

      end
      context 'all values set' do
        it 'creates a new bparam and renders' 

      end
    end
  end
end

