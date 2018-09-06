# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::PromotionCodesController do
  stub_authorization!
  render_views

  let!(:promotion) { create(:promotion) }
  let!(:code1) { create(:promotion_code, promotion: promotion) }
  let!(:code2) { create(:promotion_code, promotion: promotion) }
  let!(:code3) { create(:promotion_code, promotion: promotion) }

  it "can create a promotion rule of a valid type" 

end

