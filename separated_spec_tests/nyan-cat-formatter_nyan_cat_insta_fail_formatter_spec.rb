require 'spec_helper'
require 'stringio'
require 'nyan_cat_insta_fail_formatter'

describe NyanCatInstaFailFormatter do
  before(:all) do
    @output = StringIO.new
    @formatter = described_class.new(@output)
  end

  before(:each) do
    @formatter.start(1)
  end

  it 'displays failed tests immediately' 


end

