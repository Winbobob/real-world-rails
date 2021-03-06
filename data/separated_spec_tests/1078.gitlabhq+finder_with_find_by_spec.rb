require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/gitlab/finder_with_find_by'

describe RuboCop::Cop::Gitlab::FinderWithFindBy do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'when calling execute.find' do
    let(:source) do
      <<~SRC
      DummyFinder.new(some_args)
        .execute
        .find_by!(1)
      SRC
    end
    let(:corrected_source) do
      <<~SRC
      DummyFinder.new(some_args)
        .find_by!(1)
      SRC
    end

    it 'registers an offence' 


    it 'can autocorrect the source' 


    context 'when called within the `FinderMethods` module' do
      let(:source) do
        <<~SRC
          module FinderMethods
            def find_by!(*args)
              execute.find_by!(args)
            end
          end
        SRC
      end

      it 'does not register an offence' 

    end
  end
end

