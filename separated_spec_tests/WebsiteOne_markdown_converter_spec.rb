require 'spec_helper'

RSpec.describe MarkdownConverter, type: :service do
  subject(:markdown_converter) { MarkdownConverter.new(markdown) }

  let(:markdown) { '#This is a title' }
  let(:kramdown) { double('Kramdown::Document', to_html: "<h1>This is a title</h1>") }

  describe '#as_html' do
    it 'returns html' 

  end
end

