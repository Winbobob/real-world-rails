# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "public_body/list" do
  before do
    @pb = mock_model(PublicBody,
      :name => 'Test Quango',
      :short_name => 'tq',
      :url_name => 'testquango',
      :notes_without_html => '',
      :created_at => Time.now.utc,
      :tags => [],
      :special_not_requestable_reason? => false,
      :eir_only? => nil,
      :publication_scheme => '')
    pb_info_requests = [1, 2, 3, 4]
    allow(pb_info_requests).to receive(:is_searchable).and_return([2, 3, 4])

    allow(@pb).to receive(:info_requests).and_return(pb_info_requests)

    @public_bodies = [@pb]
    allow(@public_bodies).to receive(:total_entries).and_return(1)
    allow(@public_bodies).to receive(:total_pages).and_return(1)

    assign(:public_body, @pb)
    assign(:page, 1)
    assign(:description, 'test')
    assign(:per_page, 10)
    assign(:public_bodies, @public_bodies)
  end

  it "should be successful" 


  it "should show the body's name" 


  it "should show total number visible of requests" 

end

