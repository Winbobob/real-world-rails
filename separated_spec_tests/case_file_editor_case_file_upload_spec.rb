RSpec.describe CaseFileUpload do
  subject { described_class.new(json) }

  context 'with valid First Hearing JSON' do
    let(:json) { '{"case": {"type": "FirstHearingDCF"} }' }

    it 'has a case_file' 


    it 'has no exception' 


    it 'has validation errors' 


    it 'has schema errors' 

  end

  context 'with a Breach of Bail case file' do
    let(:json) { '{"case": {"type": "BobDCF"} }' }

    it 'has a case_file' 


    it 'has no exception' 


    it 'has validation errors' 


    it 'has schema errors' 

  end

  context 'with invalid JSON' do
    let(:json) { '!@#@#$' }

    it 'has no case_file' 


    it 'has an exception' 


    it 'has no validation errors' 


    it 'has no schema errors' 

  end
end

