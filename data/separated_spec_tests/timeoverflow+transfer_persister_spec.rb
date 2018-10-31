require 'spec_helper'

RSpec.describe Persister::TransferPersister do
  let(:source_account) { Fabricate(:account) }
  let(:destination_account) { Fabricate(:account) }
  let(:organization) { Fabricate(:organization) }
  let(:post) { Fabricate(:post, organization: organization) }
  let(:transfer) do
    Fabricate.build(
      :transfer,
      post: post,
      source: source_account,
      destination: destination_account
    )
  end
  let(:persister) { ::Persister::TransferPersister.new(transfer) }

  describe '#save' do
    before { persister.save }

    it 'saves the transfer' 


    # TODO: write better expectation
    it 'creates an event' 

  end

  describe '#update_attributes' do
    before { persister.update_attributes(amount: 666) }

    it 'updates the resource attributes' 


    # TODO: write better expectation
    it 'creates an event' 

  end
end

