# frozen_string_literal: true

require 'feature_spec_helper'

describe 'Showing the Generic File', type: :feature do
  let(:current_user) { create(:administrator) }
  let!(:gf)          { create(:public_file, depositor: current_user.login) }

  it 'allows a feature to be marked and deleted' 

end

