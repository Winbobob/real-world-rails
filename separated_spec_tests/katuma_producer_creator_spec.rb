require 'rails_helper'

module BasicResources
  describe ProducerCreator do
    let(:user) do
      user = FactoryGirl.create(:user)
      User.find(user.id)
    end
    let(:producer_creator) do
      described_class.new(
        producer: producer,
        creator: user,
        group: group
      )
    end

    describe '#create!' do
      subject { producer_creator.create! }

      context 'Without passing a `group`' do
        let(:producer) do
          Producer.new(
            name: 'Proveidor',
            email: 'pep@katuma.org',
            address: 'c/ dels Proveidors, 123'
          )
        end
        let(:group) { nil }

        it 'changes a new producer' 

        its(:persisted?) { is_expected.to be_truthy }
        its(:name) { is_expected.to eq(producer.name) }
        its(:email) { is_expected.to eq(producer.email) }
        its(:address) { is_expected.to eq(producer.address) }

        context 'when the producer is not valid' do
          let(:producer) { Producer.new(name: 'Proveidor') }

          it 'does not change the Producer.count' 

        end
      end

      context 'Passing a `group`' do
        let(:producer) do
          Producer.new(
            name: 'Proveidor',
            address: 'c/ dels Proveidors, 123'
          )
        end
        let(:group) { FactoryGirl.create(:group) }

        it 'changes a new producer' 

        its(:persisted?) { is_expected.to be_truthy }
        its(:name) { is_expected.to eq(producer.name) }
        its(:email) { is_expected.to eq(user.email) }
        its(:address) { is_expected.to eq(producer.address) }

        context 'when the producer is not valid' do
          let(:producer) { Producer.new(name: 'Proveidor') }

          it 'does not change the Producer.count' 

        end
      end

      describe '@side_effects' do
        let(:producer) do
          Producer.new(
            name: 'Proveidor',
            email: 'pep@katuma.org',
            address: 'c/ dels Proveidors, 123'
          )
        end

        before { producer_creator.create! }

        subject { producer_creator.side_effects }

        context 'Without passing a `group`' do
          let(:group) { nil }

          it { is_expected.to be_kind_of(Array) }
          its(:length) { is_expected.to eq(1) }
          its(:first) { is_expected.to be_kind_of(Membership) }

          it 'includes a membership between the producer and the creator' 

        end

        context 'Passing a `group`' do
          let(:producer) do
            Producer.new(
              name: 'Proveidor',
              email: 'pep@katuma.org',
              address: 'c/ dels Proveidors, 123'
            )
          end
          let(:group) { FactoryGirl.create(:group) }

          it 'includes a membership between the producer and the group' 

        end
      end
    end
  end
end

