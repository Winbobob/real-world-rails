require 'rails_helper'

describe StoreMailer do

    store_setting

    describe 'contact_message' do
        let(:params) { { :name => 'Tom Dallimore', :email => 'me@tomdallimore.com', :website => 'www.tomdallimore.com', :message => 'Hello, its me!' } }
        let(:mail) { StoreMailer.contact_message(params) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end
end

