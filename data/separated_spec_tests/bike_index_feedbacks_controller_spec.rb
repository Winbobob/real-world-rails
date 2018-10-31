require 'spec_helper'

describe Admin::FeedbacksController, type: :controller do
  let(:subject) { FactoryGirl.create(:feedback) }
  include_context :logged_in_as_super_admin

  describe 'index' do
    it 'renders' 

  end

  describe 'show' do
    it 'renders' 

  end

  describe 'graphs' do
    it 'returns json' 

  end
end

