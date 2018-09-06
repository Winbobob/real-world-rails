require 'spec_helper'

describe Spree::Admin::PromotionRulesController, type: :controller do
  stub_authorization!

  let!(:promotion) { create(:promotion) }

  it 'can create a promotion rule of a valid type' 


  it 'can not create a promotion rule of an invalid type' 

end

