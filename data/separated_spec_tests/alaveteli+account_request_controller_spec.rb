# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AlaveteliPro::AccountRequestController do

  describe "#index" do
    it "renders index.html.erb" 


    it 'sets the pro livery' 


    it 'assigns public beta variable' 

  end

  describe "#new" do
    it "renders index.html.erb" 


    it 'sets the pro livery' 


    it 'does not assign public beta variable' 

  end

  describe "#create" do
    let(:account_request_params){ { email: 'test@localhost',
                                    reason: 'Have a look around',
                                    marketing_emails: 'yes',
                                    training_emails: 'no' } }

    it 'sets the pro livery' 


    it 'assigns the account request' 


    context 'if the account request is valid' do

      it 'shows a notice' 


      it 'redirects to the frontpage' 


      it 'emails the pro contact address with the request' 


    end

    context 'if the account request is not valid' do

      it 'renders the index template' 


    end

  end

end

