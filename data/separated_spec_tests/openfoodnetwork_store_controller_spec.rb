require 'spec_helper'

describe Spree::StoreController, type: :controller do
  controller(Spree::StoreController) do
    before_filter :unauthorized
    def index
      render text: ""
    end
  end
  it "redirects to home when unauthorized" 

end

