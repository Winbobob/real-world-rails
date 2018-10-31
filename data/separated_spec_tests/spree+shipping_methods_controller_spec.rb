require 'spec_helper'

describe Spree::Admin::ShippingMethodsController, type: :controller do
  stub_authorization!

  # Regression test for #1240
  it 'does not hard-delete shipping methods' 

end

