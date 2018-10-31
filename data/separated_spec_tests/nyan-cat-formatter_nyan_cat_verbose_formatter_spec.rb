require 'spec_helper'
require 'stringio'
require 'nyan_cat_verbose_formatter'

describe NyanCatVerboseFormatter do
  before(:all) do
    @output = StringIO.new
    @formatter = described_class.new(@output)
  end

  before(:each) do
    @formatter.start(1)
  end

  it 'displays "running" line with name of test on the first line' 


  context 'this was the last test' do
    before(:each) do
      allow(@formatter).to receive(:finished?).and_return(true)
    end

    it 'should display an empty first line' 

  end

end

