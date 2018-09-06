require 'spec_helper'

describe AnalyticsBuildSerializer do
  let(:resource) { create(:ci_build) }

  subject { described_class.new.represent(resource) }

  context 'when there is a single object provided' do
    it 'contains important elements of analyticsBuild' 

  end
end

