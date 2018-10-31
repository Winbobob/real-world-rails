# frozen_string_literal: true

require 'spec_helper'

describe 'alchemy/essences/_essence_html_view' do
  let(:essence) { Alchemy::EssenceHtml.new(source: '<script>alert("hacked");</script>') }
  let(:content) { Alchemy::Content.new(essence: essence) }

  context 'without value' do
    let(:essence) { Alchemy::EssenceHtml.new(source: nil) }

    it "renders nothing" 

  end

  context 'with value' do
    it "renders the raw html source" 

  end
end

