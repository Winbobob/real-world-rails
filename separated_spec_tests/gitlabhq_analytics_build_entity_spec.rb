require 'spec_helper'

describe AnalyticsBuildEntity do
  let(:entity) do
    described_class.new(build, request: double)
  end

  context 'build with an author' do
    let(:user) { create(:user) }
    let(:started_at) { 2.hours.ago }
    let(:finished_at) { 1.hour.ago }
    let(:build) { create(:ci_build, author: user, started_at: started_at, finished_at: finished_at) }

    subject { entity.as_json }

    around do |example|
      Timecop.freeze { example.run }
    end

    it 'contains the URL' 


    it 'contains the author' 


    it 'does not contain sensitive information' 


    it 'contains the right started at' 


    it 'contains the duration' 


    context 'no started at or finished at date' do
      let(:started_at) { nil }
      let(:finished_at) { nil }

      it 'does not blow up' 


      it 'shows the right message' 


      it 'shows the right total time' 

    end

    context 'no started at date' do
      let(:started_at) { nil }

      it 'does not blow up' 


      it 'shows the right message' 


      it 'shows the right total time' 

    end

    context 'no finished at date' do
      let(:finished_at) { nil }

      it 'does not blow up' 


      it 'shows the right message' 


      it 'shows the right total time' 

    end
  end
end

