# frozen_string_literal: true

require 'rails_helper'

describe 'stream_entries/show.html.haml', without_verify_partial_doubles: true do
  before do
    double(:api_oembed_url => '')
    double(:account_stream_entry_url => '')
    allow(view).to receive(:show_landing_strip?).and_return(true)
    allow(view).to receive(:site_title).and_return('example site')
    allow(view).to receive(:site_hostname).and_return('example.com')
    allow(view).to receive(:full_asset_url).and_return('//asset.host/image.svg')
    allow(view).to receive(:local_time)
    allow(view).to receive(:local_time_ago)
  end

  it 'has valid author h-card and basic data for a detailed_status' 


  it 'has valid h-cites for p-in-reply-to and p-comment' 


  it 'has valid opengraph tags' 

end

