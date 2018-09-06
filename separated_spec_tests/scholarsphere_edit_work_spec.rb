# frozen_string_literal: true

require 'rails_helper'
include Warden::Test::Helpers

describe 'Editing a work', js: true do
  let(:proxy) { create(:first_proxy) }
  let(:user)  { create(:user, :with_proxy, proxy_for: proxy) }
  let(:work)  { create(:public_work, :with_required_metadata, depositor: user.user_key, creators: [sally, yuki], admin_set: AdminSet.first) }
  let(:sally) { create(:alias, display_name: 'Sally Henry',
                               agent: Agent.new(given_name: 'Sally', sur_name: 'Henry', email: 'sally@gmail.com')) }
  let(:yuki)  { create(:alias, display_name: 'Yuki Matsumoto',
                               agent: Agent.new(given_name: 'Yuki', sur_name: 'Matsumoto', email: 'yuki@gmail.com')) }

  before { login_as user }

  it 'saves the updates' 


  # Tests the basic outline of the form. This can be expanded later with more detail including
  # refactoring it to incorporate other tests.
  it 'displays the edit form' 

end

