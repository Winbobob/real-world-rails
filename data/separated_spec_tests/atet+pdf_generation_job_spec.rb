require 'rails_helper'

describe PdfGenerationJob, type: :job do
  let(:claim) { object_double Claim.new }
  let(:pdf_generation_job) { PdfGenerationJob.new }

  describe '#perform' do
    it 'generates the pdf' 

  end
end

