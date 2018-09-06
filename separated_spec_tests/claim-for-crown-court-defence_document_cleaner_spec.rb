require 'rails_helper'

RSpec.describe DocumentCleaner do
  describe '#clean!' do
    subject { DocumentCleaner.new }
    let(:document_with_claim) { create(:document) }
    let(:document_without_claim) { create(:document, claim_id: nil) }

    before { subject.clean! }

    it 'should remove documents with no claims' 

  end
end

