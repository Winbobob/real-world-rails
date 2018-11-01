# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "quietly_try_to_open" do

  let(:controller) { double(ApplicationController) }
  let(:empty_stream) { double(URI::HTTP) }
  let(:uri) { "http://example.com/feed" }

  before do
    allow(empty_stream).to receive(:read).and_return("")
  end

  it "should send a default timeout of 60 seconds" 


  it "should allow the timeout out be overriden " 


end

