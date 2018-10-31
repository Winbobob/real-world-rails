# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServerStatusController, type: :controller do
  before :each do
    allow(File).to receive(:read).with(any_args).and_call_original
    allow(File).to receive(:read).with(Regulation::REGULATIONS_JSON_PATH).and_return("{}")
    Regulation.reload_regulations
  end

  it "is happy" 


  context "jobs" do
    it "finds the oldest job that has been waiting to run" 


    it "ignores young jobs" 


    it "ignores jobs in progress" 

  end

  context "regulations" do
    it "warns about missing regulations" 


    it "warns about malformed regulations" 

  end
end

