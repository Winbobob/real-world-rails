# frozen_string_literal: true

require 'feature_spec_helper'

describe GenericWork do
  let!(:current_user) { create(:user) }
  let!(:work) { create(:public_work_with_readme, title: ['Work with README'], depositor: current_user.login) }

  before do
    described_class.all.map(&:update_index)
    FileSet.all.map(&:update_index)
    sign_in(current_user)
  end

  it 'displays the contents of the readme' 

end

