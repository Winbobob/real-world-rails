require 'spec_helper'

describe AbilitiesController do
  let(:admin_user) { create(:user, :admin) }

  before { sign_in(admin_user) }

  describe '#index' do
    render_views

    before do
      create(:ability, name: 'Ruby')
      create(:ability, name: 'Rspec')
    end

    it 'exposes abilities' 


    it 'displays abilities on view' 


    context 'user' do
      before { sign_in create(:user) }

      it 'has no access without admin rights' 

    end
  end

  describe '#create' do
    context 'with valid attributes' do
      subject { attributes_for(:ability, name: 'Ruby') }

      it 'creates a new ability' 

    end

    context 'with invalid attributes' do
      subject { attributes_for(:ability_invalid) }

      it 'does not save' 

    end
  end

  describe '#update' do
    let!(:ability) { create(:ability, name: 'Ruby') }

    it 'exposes ability' 


    context 'valid attributes' do
      it "changes ability's attributes" 

    end

    context 'invalid attributes' do
      it "does not change ability's attributes" 

    end
  end
end

