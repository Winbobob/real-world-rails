require 'rails_helper'

RSpec.describe Admin::AdminController, type: :controller do
  describe '#admin_title' do
    let(:article) { create(:article, title: 'title', subtitle: 'sub', id: 1) }

    it 'creates title using keys passed in' 


    it 'logs error and does not blow up if invalid keys passed' 


    it 'does not blow up if keys not in translation are passed in' 

  end

  describe 'when editing' do
    it 'returns the controller action translation if no model passed in' 

  end
end

