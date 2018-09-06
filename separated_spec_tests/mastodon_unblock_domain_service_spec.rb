# frozen_string_literal: true

require 'rails_helper'

describe UnblockDomainService, type: :service do
  subject { described_class.new }

  describe 'call' do
    before do
      @silenced = Fabricate(:account, domain: 'example.com', silenced: true)
      @suspended = Fabricate(:account, domain: 'example.com', suspended: true)
      @domain_block = Fabricate(:domain_block, domain: 'example.com')
    end

    context 'without retroactive' do
      it 'removes the domain block' 

    end

    context 'with retroactive' do
      it 'unsilences accounts and removes block' 


      it 'unsuspends accounts and removes block' 

    end
  end

  def expect_deleted_domain_block
    expect { @domain_block.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end

