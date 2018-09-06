# frozen_string_literal: true

require 'feature_spec_helper'

describe 'PermissionsSharing:', type: :feature do
  let(:work)         { create(:public_work_with_png, file_title: ['stonehenge star people'], depositor: current_user.login) }
  let(:current_user) { create(:user) }
  let(:file_set)     { work.file_sets.first }
  let(:filename)     { '4-20-small.png' }

  before do
    sign_in(current_user)
    visit "/concern/file_sets/#{file_set.id}"
  end

  it 'ensures that content still retains a good document outline for accessibility' 

end

