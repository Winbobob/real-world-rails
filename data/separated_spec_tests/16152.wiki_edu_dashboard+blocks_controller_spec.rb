# frozen_string_literal: true

require 'rails_helper'

describe BlocksController do
  describe '#destroy' do
    let!(:block) { create(:block) }
    let(:admin) { create(:admin, id: 2) }

    before do
      allow(controller).to receive(:current_user).and_return(admin)
    end

    it 'destroys the block' 

  end
end
