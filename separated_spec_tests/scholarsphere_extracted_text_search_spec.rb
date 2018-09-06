# frozen_string_literal: true

require 'feature_spec_helper'

describe FileSet, type: :feature, unless: travis? do
  context "when searching the file set's extraced text" do
    let!(:current_user) { create(:user) }
    let!(:work) { create(:public_work_with_pdf, title: ['Full-text work'], depositor: current_user.login) }

    before do
      GenericWork.all.map(&:update_index)
      FileSet.all.map(&:update_index)
      sign_in(current_user)
    end

    it "returns the file set's containing work" 

  end
end

