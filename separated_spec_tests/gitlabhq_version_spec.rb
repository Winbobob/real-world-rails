require 'spec_helper'

describe API::Version do
  describe 'GET /version' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      let(:user) { create(:user) }

      it 'returns the version information' 

    end
  end
end

