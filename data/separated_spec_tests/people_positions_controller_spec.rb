require 'spec_helper'

describe PositionsController do
  let(:admin_user) { create(:user, :admin) }

  before { sign_in(admin_user) }

  describe '#new' do
    before { get :new }

    it 'responds success with HTTP status 200' 


    it 'exposes new position' 

  end

  describe '#create' do
    let(:role) { create(:role, name: 'junior1', technical: true) }
    let(:user) { create(:user, primary_role: role) }
    let!(:params) { attributes_for(:position, user_id: user.id, role_id: role.id) }

    context 'with valid attributes' do
      it 'creates a new position' 

    end

    context 'with invalid attributes' do
      let(:invalid_params) { params.except(:starts_at) }

      it 'does not save' 

    end
  end

  describe '#update' do
    let(:role) { create(:role, name: 'junior1', technical: true) }
    let(:user) { create(:user, primary_role: role) }
    let!(:position) { create(:position, user: user, role: role) }

    it 'exposes positions' 


    context 'valid attributes' do
      it 'changes position start date' 

    end

    context 'invalid attributes' do
      it 'does not change position attributes' 

    end
  end

  describe '#destroy' do
    let(:intern_role) { create(:role, name: 'intern', technical: true) }
    let(:user) { create(:user, primary_role: intern_role) }
    let!(:position) { create(:position, user: user, role: intern_role) }

    it 'deletes the position' 

  end

  describe '#toggle_primary' do
    subject { put :toggle_primary, id: position.id }
    let(:junior_role) { create(:role, name: 'junior', technical: true) }
    let(:user) { create(:user, primary_role: junior_role) }
    let(:intern_role) { create(:role, name: 'intern', technical: true) }

    before { sign_in(user) }

    context 'when position is not primary' do
      let!(:position) { create(:position, user: user, role: intern_role, primary: false) }

      it 'toggles position to primary' 


      it 'sends mail with position change' 


      it 'updates user primary role' 

    end

    context 'when position is primary' do
      let!(:position) { create(:position, user: user, role: intern_role, primary: true) }

      let(:intern_role) { create(:role, name: 'intern', technical: true) }

      it 'toggles position to not primary' 

    end
  end
end

