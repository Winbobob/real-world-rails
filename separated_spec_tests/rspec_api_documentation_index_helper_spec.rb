require 'spec_helper'

describe RspecApiDocumentation::Writers::IndexHelper do
  describe "#sections" do
    let(:example_1) { double(:resource_name => "Order", :description => "Updating an order", resource_explanation: 'Resource explanation') }
    let(:example_2) { double(:resource_name => "Order", :description => "Creating an order", resource_explanation: 'Resource explanation') }
    let(:example_3) { double(:resource_name => "Cart",  :description => "Creating an cart",  resource_explanation: 'Resource explanation') }
    let(:examples)  { [example_1, example_2, example_3] }

    context "with default value for keep_source_order" do
      let(:configuration) { RspecApiDocumentation::Configuration.new }
      subject { RspecApiDocumentation::Writers::IndexHelper.sections(examples, configuration) }

      it "should order resources by resource name" 


      it "should order examples by description" 

    end

    context "with keep_source_order set to true" do
      subject { RspecApiDocumentation::Writers::IndexHelper.sections(examples, double(:keep_source_order => true)) }

      it "should order resources by source code declaration" 


      it "should order examples by source code declaration" 

    end
  end
end

