require 'spec_helper'

describe GroupChildSerializer do
  let(:request) { double('request') }
  let(:user) { create(:user) }
  subject(:serializer) { described_class.new(current_user: user) }

  describe '#represent' do
    context 'for groups' do
      it 'can render a single group' 


      it 'can render a collection of groups' 

    end

    context 'with a hierarchy', :nested_groups do
      let(:parent) { create(:group) }

      subject(:serializer) do
        described_class.new(current_user: user).expand_hierarchy(parent)
      end

      it 'expands the subgroups' 


      it 'can render a nested tree' 


      context 'without a specified parent' do
        subject(:serializer) do
          described_class.new(current_user: user).expand_hierarchy
        end

        it 'can render a tree' 

      end
    end

    context 'for projects' do
      it 'can render a single project' 


      it 'can render a collection of projects' 


      context 'with a hierarchy', :nested_groups do
        let(:parent) { create(:group) }

        subject(:serializer) do
          described_class.new(current_user: user).expand_hierarchy(parent)
        end

        it 'can render a nested tree' 


        it 'returns an array when an array of a single instance was given' 

      end
    end
  end
end

