require 'spec_helper'

describe Presenters::StatusFilter do
  include Rails.application.routes.url_helpers

  let(:params) {{
    :qstatus    => 'test_key',
    :controller => 'dashboard',
    :action     => 'by_status'
  }}

  let(:label) {
    'test label'
  }

  let(:filter) {
    Presenters::StatusFilter.new(1, 'test_key', label, params)
  }

  describe "#link" do
    it "returns the correct path" 

  end

  describe "#active?" do
    context "when key and active_key match" do
      it "returns true" 

    end

    context "when key and active_key do not match" do
      let(:params) {{
        :qstatus    => 'other-key',
        :controller => 'dashboard',
        :action     => 'by_status'
      }}

      it "returns false" 

    end
  end

  describe "#label" do
    context "when no label has been supplied" do
      let(:label) { nil }

      it "returns the key value" 

    end

    context "when a label is supplied" do
      it "returns the label value" 

    end
  end
end

