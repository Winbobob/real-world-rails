require 'spec_helper'

describe AbuseReportsController do
  let(:reporter) { create(:user) }
  let(:user)     { create(:user) }
  let(:attrs) do
    attributes_for(:abuse_report) do |hash|
      hash[:user_id] = user.id
    end
  end

  before do
    sign_in(reporter)
  end

  describe 'GET new' do
    context 'when the user has already been deleted' do
      it 'redirects the reporter to root_path' 

    end

    context 'when the user has already been blocked' do
      it 'redirects the reporter to the user\'s profile' 

    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves the abuse report' 


      it 'calls notify' 


      it 'redirects back to the reported user' 

    end

    context 'with invalid attributes' do
      it 'renders new' 

    end
  end
end

