# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InfoRequestBatchMailer do

  describe 'when sending batch sent notification' do

    before do
      @user = FactoryGirl.create(:user)
      @info_request_batch = FactoryGirl.create(:info_request_batch)
      @public_body = FactoryGirl.create(:public_body)
      @unrequestable = [@public_body]
      @mail = InfoRequestBatchMailer.batch_sent(@info_request_batch, @unrequestable, @user)
    end

    it 'renders the subject' 


    it "does not add HTMLEntities to the subject line" 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'assigns @unrequestable' 


    it 'assigns @url' 

  end
end

