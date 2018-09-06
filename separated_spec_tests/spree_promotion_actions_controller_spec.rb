require 'spec_helper'

describe Spree::Admin::PromotionActionsController, type: :controller do
  stub_authorization!

  let!(:promotion) { create(:promotion) }

  it 'can create a promotion action of a valid type' 


  it 'can not create a promotion action of an invalid type' 

end

