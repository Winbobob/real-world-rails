# frozen_string_literal: true

require 'feature_spec_helper'

include Selectors::Dashboard

describe 'Dashboard Shares', type: :feature do
  let(:current_user) { create(:user) }
  let(:jill)         { create(:jill) }

  let!(:collection) { create(:collection, depositor: current_user.user_key) }
  let!(:gf)         { create(:public_file, title: ['Public, unshared file'], depositor: jill.user_key) }

  let!(:gf2) do
    create(:private_file, title: ['Private, shared filed'],
                          depositor: jill.user_key,
                          edit_users: [current_user.user_key])
  end

  before do
    sign_in_with_js(current_user)
    go_to_dashboard_shares
  end

  it 'displays only shared files' 

end

