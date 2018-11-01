require 'rails_helper'

describe Admin::ReportsController do
  render_views

  let(:user) { Fabricate(:user, admin: true) }
  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    it 'returns http success with no filters' 


    it 'returns http success with resolved filter' 

  end

  describe 'GET #show' do
    it 'renders report' 

  end

  describe 'PUT #update' do
    describe 'with an unknown outcome' do
      it 'rejects the change' 

    end

    describe 'with an outcome of `resolve`' do
      it 'resolves the report' 

    end

    describe 'with an outsome of `silence`' do
      it 'silences the reported account' 

    end

    describe 'with an outsome of `reopen`' do
      it 'reopens the report' 

    end

    describe 'with an outsome of `assign_to_self`' do
      it 'reopens the report' 

    end

    describe 'with an outsome of `unassign`' do
      it 'reopens the report' 

    end
  end
end

