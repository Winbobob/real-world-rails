require 'spec_helper'
require 'stringio'
require 'nyan_cat_wide_formatter'

describe NyanCatWideFormatter do
  before do
    @output = StringIO.new
    @formatter = NyanCatWideFormatter.new(@output)
  end

  describe "cat situation" do
    before do
      allow(@formatter).to receive(:terminal_width).and_return(100)
      allow(@formatter).to receive(:cat_length).and_return(11)
      @whole_net_width = 100 - 2*2 - 6 - 11
    end

    context "for rspec 3" do
      context "to avoid deprecation warnings" do
        it "registers a nyan cat wide formatter compatible with rspec 3 format" 

      end
    end

    context "for 35 examples" do
      before do
        @formatter.start(35)
      end

      it "should calculate the net width for example 3" 


      it "should calculate the net width for example 30" 

    end

    context "for 50 examples" do
      before { @formatter.start(50) }

      it "should calculate the net width for example 1" 


      it "should calculate the net width for example 25" 

    end
  end
end

