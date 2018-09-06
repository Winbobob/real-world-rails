# frozen_string_literal: true

require 'spec_helper'

describe "ReturnAuthorizations", type: :feature do
  include OrderFeatureHelper

  stub_authorization!

  let!(:order) { create(:shipped_order) }
  let!(:return_authorization) { create(:return_authorization, order: order) }

  it "can visit the return authorizations list page" 


  describe "edit" do
    it "can visit the return authorizations edit page" 


    it "return authorizations edit page has a data hook for extensions to add content above, below or within the RA form" 

  end
end

