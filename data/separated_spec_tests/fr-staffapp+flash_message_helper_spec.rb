require 'rails_helper'

RSpec.describe FlashMessageHelper, type: :helper do

  it { expect(helper).to be_a described_class }

  describe '#format_managers_combined_contacts' do
    context ' when not expected to start a sentence' do
      subject { helper.format_managers_combined_contacts(managers) }

      context 'when passed a collection of Users' do
        let(:managers) { create_list :manager, 2 }
        it 'returns a single html mailto link with all managers' 

      end

      context 'when passed no users' do
        let(:managers) { [] }
        it 'returns a  string' 

      end
    end

    context 'when expected to start a sentence' do
      subject { helper.format_managers_combined_contacts(managers, true) }

      context 'when passed a collection of Users' do
        let(:managers) { create_list :manager, 2 }
        it 'returns a single html mailto link with all managers with capitalised text' 

      end

      context 'when passed no users' do
        let(:managers) { [] }
        it 'returns a capitalised string' 

      end
    end
  end
end

