require 'spec_helper'


module OpenFoodNetwork
  describe OrderAndDistributorReport do

    describe "orders and distributors report" do

      before(:each) do
        #normal completed order
        @bill_address = create(:address)
        @distributor_address = create(:address, :address1 => "distributor address", :city => 'The Shire', :zipcode => "1234")
        @distributor = create(:distributor_enterprise, :address => @distributor_address)
        product = create(:product)
        product_distribution = create(:product_distribution, :product => product, :distributor => @distributor)
        @shipping_instructions = "pick up on thursday please!"
        @order = create(:order, :distributor => @distributor, :bill_address => @bill_address, :special_instructions => @shipping_instructions)
        @payment_method = create(:payment_method, :distributors => [@distributor])
        payment = create(:payment, :payment_method => @payment_method, :order => @order )
        @order.payments << payment
        @line_item = create(:line_item, :product => product, :order => @order)
        @order.line_items << @line_item
      end

      it "should return a header row describing the report" 


      it "should denormalise order and distributor details for display as csv" 

    end
  end
end

