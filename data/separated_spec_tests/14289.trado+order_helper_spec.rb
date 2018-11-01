require 'rails_helper'

describe OrderHelper do

    describe '#status_label' do
        let(:dispatched) { create(:order, shipping_status: 'dispatched') }
        let(:completed) { create(:transaction) }
        let(:pending) { create(:transaction, payment_status: 'pending') }
        let(:failed) { create(:transaction, payment_status: 'failed') }

        context "if the status parameter value is 'Pending'" do

            it "should return a html_safe string with a 'Pending' status" 

        end

        context "if the status parameter value is 'Completed'" do

            it "should return a html_safe string with a 'Completed' status" 

        end

        context "if the status parameter value is 'Dispatched'" do

            it "should return a html_safe string with a 'Dispatched' status" 

        end

        context "if it is neither 'Pending' or 'Completed'" do

            it "should return a html_safe string with a 'Failed' status" 

        end
    end

    describe "#order_filter_classes" do

        context "if order is dispatched" do
            let!(:order) { create(:complete_order) }

            it "should render order-dispatched class" 

        end

        context "if order is not dispatched" do
            let!(:order) { create(:undispatched_complete_order) }

            it "should render order-pending class" 

        end
    end
end

