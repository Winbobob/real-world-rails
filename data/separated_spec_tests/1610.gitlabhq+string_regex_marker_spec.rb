require 'spec_helper'

describe Gitlab::StringRegexMarker do
  describe '#mark' do
    context 'with a single occurrence' do
      let(:raw)  { %{"name": "AFNetworking"} }
      let(:rich) { %{<span class="key">"name"</span><span class="punctuation">: </span><span class="value">"AFNetworking"</span>}.html_safe }

      subject do
        described_class.new(raw, rich).mark(/"[^"]+":\s*"(?<name>[^"]+)"/, group: :name) do |text, left:, right:|
          %{<a href="#">#{text}</a>}
        end
      end

      it 'marks the match' 

    end

    context 'with multiple occurrences' do
      let(:raw)  { %{a <b> <c> d} }
      let(:rich) { %{a &lt;b&gt; &lt;c&gt; d}.html_safe }

      subject do
        described_class.new(raw, rich).mark(/<[a-z]>/) do |text, left:, right:|
          %{<strong>#{text}</strong>}
        end
      end

      it 'marks the matches' 

    end
  end
end

