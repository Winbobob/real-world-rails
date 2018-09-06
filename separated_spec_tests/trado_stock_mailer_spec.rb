require 'rails_helper'

describe StockMailer do

    store_setting

    describe 'notification' do
        let(:sku) { create(:sku) }
        let(:user) { create(:user) }
        let(:mail) { StockMailer.notification(sku, user.email) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end
end

