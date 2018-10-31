require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'should succeed' 

  end

  describe 'GET #show' do
    let(:proposal) { build(:proposal) }
    let(:event) { create(:event, proposals: [proposal]) }

    it 'should succeed' 

  end

end

