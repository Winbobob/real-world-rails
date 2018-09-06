require 'spec_helper'

describe Admin::GraphsController, type: :controller do
  include_context :logged_in_as_super_admin
  describe 'index' do
    context 'graphs' do
      it 'renders' 

    end
    context 'tables' do
      it 'redirects to tables' 

    end
  end

  describe 'tables' do
    it 'renders' 

  end

  describe 'users' do
    it 'returns json' 

  end

  describe 'bikes' do
    context 'no params' do
      it 'returns JSON array' 

    end
    context 'start_at passed' do
      it 'returns JSON array' 

    end
  end
end

