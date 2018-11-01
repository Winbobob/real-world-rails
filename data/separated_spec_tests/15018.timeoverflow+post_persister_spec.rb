require 'spec_helper'

RSpec.describe Persister::PostPersister do
  let(:organization) { Fabricate(:organization) }
  let(:user) { Fabricate(:user) }
  let(:category) { Fabricate(:category) }
  let(:post) do
    Fabricate.build(
      :offer,
      organization: organization,
      user: user,
      category: category,
      title: 'Title'
    )
  end
  let(:persister) { ::Persister::PostPersister.new(post) }
  let(:event) { Fabricate.build(:event, id: 27) }

  describe '#save' do
    it 'saves the post' 


    it 'creates an event' 


    context 'background job' do
      before do
        allow(::Event).to receive(:create!).and_return(event)
      end

      it 'enqueues a CreatePushNotificationsJob background job' 

    end
  end

  describe '#update_attributes' do
    it 'updates the resource attributes' 


    it 'creates an event' 


    context 'background job' do
      before do
        allow(::Event).to receive(:create!).and_return(event)
      end

      it 'enqueues a CreatePushNotificationsJob background job' 

    end
  end
end

