require 'spec_helper'

describe Admin::NewsController, type: :controller do
  let(:subject) { FactoryGirl.create(:blog) }
  include_context :logged_in_as_super_admin

  describe 'index' do
    it 'renders' 

  end

  describe 'edit' do
    context 'standard' do
      it 'renders' 

    end
  end

  describe 'update' do
    it 'updates available attributes' 

  end
end

