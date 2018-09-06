# coding: utf-8
require "spec_helper"

describe Filters::InlineCss do
  context "html email with no styling" do
    let(:html) { "<p>This is HTML with “some” UTF-8</p>" }

    it "#filter_html" 

  end

  context "html email with style block" do
    let(:html) { "<head><style>p { font-size: 20px; }</style></head><body><p>This is HTML with “some” UTF-8</p></body>" }

    it "#filter_html" 

  end
end

