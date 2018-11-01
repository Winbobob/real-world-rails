require 'spec_helper'

RSpec.describe Persister::MemberPersister do
  let(:organization) { Fabricate(:organization) }
  let(:user) { Fabricate(:user) }
  let(:member) { Fabricate.build(:member, user: user, organization: organization) }
  let(:persister) { ::Persister::MemberPersister.new(member) }

  describe '#save' do
    before { persister.save }

    it 'saves the member' 


    # TODO: write better expectation
    it 'creates an event' 

  end

  describe '#update_attributes' do
    before { persister.update_attributes(member_uid: 666) }

    it 'updates the resource attributes' 


    # TODO: write better expectation
    it 'creates an event' 

  end
end

