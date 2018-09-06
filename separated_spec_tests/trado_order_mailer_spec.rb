require 'rails_helper'

describe OrderMailer do

    store_setting

    describe 'completed' do
        let!(:order) { create(:addresses_complete_order) }
        let(:mail) { OrderMailer.completed(order) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end

    describe 'pending' do
        let!(:order) { create(:addresses_complete_order) }
        let(:mail) { OrderMailer.pending(order) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end

    describe 'failed' do
        let!(:order) { create(:addresses_complete_order) }
        let(:mail) { OrderMailer.failed(order) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end

    describe 'dispatched' do
        let!(:order) { create(:addresses_complete_order) }
        let(:mail) { OrderMailer.dispatched(order) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end

    describe 'updated_dispatched' do
        let!(:order) { create(:addresses_complete_order) }
        let(:mail) { OrderMailer.updated_dispatched(order) }

        it 'should render the subject' 


        it 'should render the receiver email' 


        it 'should render the from email' 

    end
end

