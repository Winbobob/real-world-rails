require 'spec_helper'

describe Gitlab::QuickActions::SubstitutionDefinition do
  let(:content) do
    <<EOF
Hello! Let's do this!
/sub_name I like this stuff
EOF
  end
  subject do
    described_class.new(:sub_name, action_block: proc { |text| "#{text} foo" })
  end

  describe '#perform_substitution!' do
    it 'returns nil if content is nil' 


    it 'performs the substitution by default' 

  end

  describe '#match' do
    it 'checks the content for the command' 


    it 'returns the match data' 


    it 'is nil if content does not have the command' 

  end
end

