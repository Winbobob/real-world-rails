# frozen_string_literal: true

require 'rails_helper'

describe 'about/show.html.haml', without_verify_partial_doubles: true do
  before do
    allow(view).to receive(:site_hostname).and_return('example.com')
    allow(view).to receive(:site_title).and_return('example site')
  end

  it 'has valid open graph tags' 

end

