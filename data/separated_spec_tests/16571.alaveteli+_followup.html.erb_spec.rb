# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "followups/_followup.html.erb" do

  let(:info_request) { FactoryBot.create(:info_request) }

  before do
    assign :info_request, info_request
    assign :internal_review, false
    assign :outgoing_message, OutgoingMessage.new(info_request: info_request)
    assign :is_owning_user, true
  end

  it "renders the normal title partial when the request is not embargoed" 


  it "renders the pro title partial when the request is embargoed" 


  describe 'the request is overdue' do

    context 'the authority is subject to FOI law' do

      it 'tells the user the authority should have responded by law' 


    end

    context 'the authority is not subject to FOI law' do

      it 'tells the user the authority should have responded by law' 


    end

  end

  describe 'the request is very overdue' do

    context 'the authority is subject to FOI law' do

      it 'tells the user the authority should have responded by law' 


    end

    context 'the authority is not subject to FOI law' do

      it 'tells the user the authority should have responded by law' 


    end

  end
end

