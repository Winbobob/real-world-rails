# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::PromotionRulesController, type: :controller do
  let!(:promotion) { create(:promotion) }

  context "when the user is authorized" do
    stub_authorization! do |_u|
      Spree::PermissionSets::PromotionManagement.new(self).activate!
    end

    it "can create a promotion rule of a valid type" 


    it "can not create a promotion rule of an invalid type" 

  end

  context "when the user is not authorized" do
    it "sets an error message and redirects the user" 

  end
end

