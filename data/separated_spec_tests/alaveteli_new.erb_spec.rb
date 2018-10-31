# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe 'reports/new.html.erb' do
  let(:info_request) { FactoryGirl.build(:info_request) }
  before :each do
    assign(:info_request, info_request)
    assign(:report_reasons, info_request.report_reasons)
  end

  it "should show a form" 


  context "reporting a request" do

    it "has a 'Report request' button" 


  end

  context "reporting a comment" do

    let(:comment) do
      FactoryGirl.build(:comment, :info_request => info_request)
    end

    before :each do
      assign(:comment, comment)
      assign(:report_reasons, comment.report_reasons)
    end

    it "includes the comment_id in a hidden field" 


    it "has a 'Report annotation' button" 


  end

  context "request has already been reported" do
    before :each do
      allow(info_request).to receive(:attention_requested).and_return(true)
    end

    it "should not show a form" 


    it "should say it's already been reported" 

  end
end

