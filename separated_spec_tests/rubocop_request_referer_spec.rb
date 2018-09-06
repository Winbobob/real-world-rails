# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::RequestReferer, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is referer' do
    let(:cop_config) { { 'EnforcedStyle' => 'referer' } }

    it 'registers an offense for request.referrer' 


    it 'autocorrects referrer with referer' 

  end

  context 'when EnforcedStyle is referrer' do
    let(:cop_config) { { 'EnforcedStyle' => 'referrer' } }

    it 'registers an offense for request.referer' 


    it 'autocorrects referer with referrer' 

  end
end

