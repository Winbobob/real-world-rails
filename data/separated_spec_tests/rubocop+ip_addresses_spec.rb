# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::IpAddresses, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { {} }

  it 'does not register an offense on an empty string' 


  context 'IPv4' do
    it 'registers an offense for a valid address' 


    it 'does not register an offense for an invalid address' 


    it 'does not register an offense for an address inside larger text' 

  end

  context 'IPv6' do
    it 'registers an offense for a valid address' 


    it 'registers an offense for an address with 0s collapsed' 


    it 'registers an offense for a shortened address' 


    it 'registers an offense for a very short address' 


    it 'registers an offense for the loopback address' 


    it 'does not register an offense for an invalid address' 


    context 'the unspecified address :: (shortform of 0:0:0:0:0:0:0:0)' do
      it 'does not register an offense' 


      context 'when it is removed from the whitelist' do
        let(:cop_config) { { 'Whitelist' => [] } }

        it 'registers an offense' 

      end
    end
  end

  context 'with whitelist' do
    let(:cop_config) { { 'Whitelist' => ['a::b'] } }

    it 'does not register an offense for a whitelisted address' 


    it 'does not register an offense if the case differs' 

  end
end

