require 'spec_helper'

describe UrlValidator do
  let!(:badge) { build(:badge, link_url: 'http://www.example.com') }
  subject { validator.validate_each(badge, :link_url, badge.link_url) }

  include_examples 'url validator examples', described_class::DEFAULT_PROTOCOLS

  context 'by default' do
    let(:validator) { described_class.new(attributes: [:link_url]) }

    it 'does not block urls pointing to localhost' 


    it 'does not block urls pointing to the local network' 


    it 'strips urls' 

  end

  context 'when allow_localhost is set to false' do
    let(:validator) { described_class.new(attributes: [:link_url], allow_localhost: false) }

    it 'blocks urls pointing to localhost' 

  end

  context 'when allow_local_network is set to false' do
    let(:validator) { described_class.new(attributes: [:link_url], allow_local_network: false) }

    it 'blocks urls pointing to the local network' 

  end

  context 'when ports is' do
    let(:validator) { described_class.new(attributes: [:link_url], ports: ports) }

    context 'empty' do
      let(:ports) { [] }

      it 'does not block any port' 

    end

    context 'set' do
      let(:ports) { [443] }

      it 'blocks urls with a different port' 

    end
  end

  context 'when enforce_user is' do
    let(:url) { 'http://$user@example.com'}
    let(:validator) { described_class.new(attributes: [:link_url], enforce_user: enforce_user) }

    context 'true' do
      let(:enforce_user) { true }

      it 'checks user format' 

    end

    context 'false (default)' do
      let(:enforce_user) { false }

      it 'does not check user format' 

    end
  end
end

