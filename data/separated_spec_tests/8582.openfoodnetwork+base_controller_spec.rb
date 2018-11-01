require 'spec_helper'

describe BaseController, :type => :controller do
  let(:oc)    { instance_double(OrderCycle, id: 1) }
  let(:order) { instance_double(Spree::Order) }
  controller(BaseController) do
    def index
      render text: ""
    end
  end

  it "redirects to home with message if order cycle is expired" 

end

