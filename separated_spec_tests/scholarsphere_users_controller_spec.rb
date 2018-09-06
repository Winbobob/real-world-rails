# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user, login: 'abc123') }
  let!(:agent) { create(:agent, psu_id: user.login) }

  before { sign_in user }
  routes { Sufia::Engine.routes }

  describe '#update' do
    it 'updates the orcid and copies the orcid to the agent' 

  end
end

