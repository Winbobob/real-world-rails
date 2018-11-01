# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "alaveteli_pro/info_requests/new.html.erb" do
  let!(:public_body) { FactoryBot.create(:public_body) }
  let(:draft_info_request) { FactoryBot.create(:draft_info_request) }
  let(:info_request) { InfoRequest.from_draft(draft_info_request) }
  let(:outgoing_message) { info_request.outgoing_messages.first }
  let(:embargo) { info_request.embargo }

  def assign_variables
    assign :draft_info_request, draft_info_request
    assign :info_request, info_request
    assign :outgoing_message, outgoing_message
    assign :embargo, embargo
  end

  it "sets a data-initial-authority attribute on the public body search" 


  it "sets a data-search-url attribute on the public body search" 


  it "includes a hidden field for the body id" 

end

