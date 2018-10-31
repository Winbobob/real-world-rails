require 'spec_helper'

describe TestCaseEntity do
  include TestReportsHelper

  let(:entity) { described_class.new(test_case) }

  describe '#as_json' do
    subject { entity.as_json }

    context 'when test case is success' do
      let(:test_case) { create_test_case_rspec_success }

      it 'contains correct test case details' 

    end

    context 'when test case is failed' do
      let(:test_case) { create_test_case_rspec_failed }

      it 'contains correct test case details' 

    end
  end
end

