require 'spec_helper'

describe GravatarService do
  describe '#execute' do
    let(:url) { 'http://example.com/avatar?hash=%{hash}&size=%{size}&email=%{email}&username=%{username}' }

    before do
      allow(Gitlab.config.gravatar).to receive(:plain_url).and_return(url)
    end

    it 'replaces the placeholders' 

  end
end

