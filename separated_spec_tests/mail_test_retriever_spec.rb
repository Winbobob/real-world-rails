# frozen_string_literal: true
require 'spec_helper'

describe "Test Retriever" do

  before(:each) do
    Mail.defaults do
      retriever_method :test
    end
  end

  it "should have no emails initially" 


  describe "all" do
    
    before do
      @emails = populate(15)
    end

    it "should return all emails without a block" 


    it "should return all emails with a block" 


  end
  
  describe "find" do

    before do
      @emails = populate(15)
    end

    it "should handle the :count option" 


    it "should handle the :order option" 


    it "should handle the :what option" 


    it "should handle the both of :what and :order option with :count => 1" 


    it "should handle the :delete_after_find option" 


    it "should handle the both of :delete_after_find and :count option" 


    it "should handle the :delete_after_find option with messages marked not for delete" 


  end


  private

  def populate(count)
    (1..count).map do
      Mail.new do
        to 'mikel@me.com'
        from 'you@you.com'
        subject 'testing'
        body 'hello'
      end
    end.tap do |emails|
      Mail::TestRetriever.emails = emails.dup
    end
  end

end

