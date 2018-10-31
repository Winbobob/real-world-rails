require 'open_food_network/distribution_change_validator'

describe DistributionChangeValidator do
  let(:order) { double(:order) }
  let(:subject) { DistributionChangeValidator.new(order) }
  let(:product) { double(:product) }

  describe "checking if an order can change to a specified new distribution" do
    let(:distributor) { double(:distributor) }
    let(:order_cycle) { double(:order_cycle) }

    it "returns false when a variant is not available for the specified distribution" 


    it "returns true when all variants are available for the specified distribution" 

  end

  describe "finding variants that are available through a particular distribution" do
    it "finds variants distributed by product distribution" 


    it "finds variants distributed by product distribution when order cycle is nil" 


    it "finds variants distributed by order cycle" 


    it "returns an empty array when distributor and order cycle are both nil" 

  end

  describe "finding distributors which have the same variants" do
    let(:variant1) { double(:variant) }
    let(:variant2) { double(:variant) }
    let(:variant3) { double(:variant) }
    let(:variant4) { double(:variant) }
    let(:variant5) { double(:variant) }

    it "matches enterprises which offer all products within the order" 


    it "does not match enterprises with no products available" 


    it "does not match enterprises with only some of the same variants in the order available" 


    it "matches enterprises which offer all products in the order, plus additional products" 


    it "matches no enterprises when none are provided" 

  end

  describe "finding order cycles which have the same variants" do
    let(:variant1) { double(:variant) }
    let(:variant2) { double(:variant) }
    let(:variant3) { double(:variant) }
    let(:variant4) { double(:variant) }
    let(:variant5) { double(:variant) }

    it "matches order cycles which offer all products within the order" 


    it "does not match order cycles with no products available" 


    it "does not match order cycles with only some of the same variants in the order available" 


    it "matches order cycles which offer all products in the order, plus additional products" 


    it "matches no order cycles when none are provided" 

  end

  describe "checking if a distributor is available for a product" do
    it "returns true when order is nil" 


    it "returns true when there's an distributor that can cover the new product" 


    it "returns false when there's no distributor that can cover the new product" 

  end

  describe "checking if an order cycle is available for a product" do
    it "returns true when the order is nil" 


    it "returns true when the product doesn't require an order cycle" 


    it "returns true when there's an order cycle that can cover the product" 


    it "returns false otherwise" 

  end

  describe "finding available distributors for a product" do
    it "returns enterprises distributing the product when there's no order" 


    it "returns enterprises distributing the product when there's no order items" 


    it "filters by available distributors when there are order items" 

  end

  describe "finding available order cycles for a product" do
    it "returns order cycles distributing the product when there's no order" 


    it "returns order cycles distributing the product when there's no order items" 


    it "filters by available order cycles when there are order items" 

  end

  describe "determining if a product requires an order cycle" do
    it "returns true when the product does not have any product distributions" 


    it "returns false otherwise" 

  end
end

