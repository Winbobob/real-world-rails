require 'spec_helper'

describe Gitlab::HookData::IssueBuilder do
  set(:issue) { create(:issue) }
  let(:builder) { described_class.new(issue) }

  describe '#build' do
    let(:data) { builder.build }

    it 'includes safe attribute' 


    it 'includes additional attrs' 

  end
end

