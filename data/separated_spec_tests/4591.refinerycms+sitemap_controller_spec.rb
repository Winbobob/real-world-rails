require 'spec_helper'

module Refinery
  describe SitemapController, :type => :controller do
    before (:each) do
      @request.env['HTTP_ACCEPT'] = 'application/xml'
    end

    it "shows a valid xml response" 

  end
end

