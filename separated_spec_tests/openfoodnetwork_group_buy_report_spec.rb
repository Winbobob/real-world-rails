require 'spec_helper'

module OpenFoodNetwork
  describe GroupBuyReport do

    before(:each) do
      @orders = []
      bill_address = create(:address)
      distributor_address = create(:address, :address1 => "distributor address", :city => 'The Shire', :zipcode => "1234")
      distributor = create(:distributor_enterprise, :address => distributor_address)

      @supplier1 = create(:supplier_enterprise)
      @variant1 = create(:variant)
      @variant1.product.supplier = @supplier1
      @variant1.product.save!
      product_distribution = create(:product_distribution, :product => @variant1.product, :distributor => distributor)
      shipping_instructions = "pick up on thursday please!"

      order1 = create(:order, :distributor => distributor, :bill_address => bill_address, :special_instructions => shipping_instructions)
      line_item11 = create(:line_item, :variant => @variant1, :order => order1)
      order1.line_items << line_item11
      @orders << order1

      order2 = create(:order, :distributor => distributor, :bill_address => bill_address, :special_instructions => shipping_instructions)
      line_item21 = create(:line_item, :variant => @variant1, :order => order2)
      order2.line_items << line_item21

      @variant2 = create(:variant)
      @variant2.product.supplier = @supplier1
      @variant2.product.save!
      product_distribution = create(:product_distribution, :product => @variant2.product, :distributor => distributor)

      line_item22 = create(:line_item, :variant => @variant2, :order => order2)
      order2.line_items << line_item22
      @orders << order2

      @supplier2 = create(:supplier_enterprise)
      @variant3 = create(:variant, :weight => nil)
      @variant3.product.supplier = @supplier2
      @variant3.product.save!
      product_distribution = create(:product_distribution, :product => @variant3.product, :distributor => distributor)

      order3 = create(:order, :distributor => distributor, :bill_address => bill_address, :special_instructions => shipping_instructions)
      line_item31 = create(:line_item, :variant => @variant3, :order => order3)
      order3.line_items << line_item31
      @orders << order3
    end

    it "should return a header row describing the report" 


    it "should provide the required variant and quantity information in a table" 


    it "should return a table wherein each rows contains the same number of columns as the heading" 


    it "should split and group line items from multiple suppliers and of multiple variants" do 
      subject = GroupBuyReport.new @orders

      table_row_objects = subject.variants_and_quantities

      variant_rows = table_row_objects.select { |r| r.class == OpenFoodNetwork::GroupBuyVariantRow }
      product_rows = table_row_objects.select { |r| r.class == OpenFoodNetwork::GroupBuyProductRow }

      supplier_groups = variant_rows.group_by { |r| r.variant.product.supplier }
      variant_groups = variant_rows.group_by { |r| r.variant }
      product_groups = product_rows.group_by { |r| r.product }

      supplier_groups.length.should == 2
      variant_groups.length.should == 3
      product_groups.length.should == 3
    end
  end
end

