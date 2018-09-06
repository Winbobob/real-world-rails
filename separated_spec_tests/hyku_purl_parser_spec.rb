require 'stanford'

RSpec.describe Stanford::Importer::PurlParser do
  let(:xml) { fixture_file('purl/bc390xk2647.xml').read }
  let(:parser) { described_class.new(xml) }

  describe "attributes" do
    subject { parser.attributes }

    it "has required attributes" 

  end
end

