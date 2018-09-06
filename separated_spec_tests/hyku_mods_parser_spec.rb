require 'importer'

RSpec.describe Importer::ModsParser do
  let(:parser) { described_class.new(file) }
  let(:attributes) { parser.attributes }

  describe 'Determine which kind of record it is:' do
    describe 'for a collection:' do
      let(:file) { 'spec/fixtures/mods/shpc/kx532cb7981.mods' }

      it 'knows it is a Collection' 

    end

    describe 'for an image:' do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'knows it is an Image' 

    end
  end

  describe '#attributes for an Image record' do
    let(:ns_decl) { "xmlns='#{Mods::MODS_NS}'" }
    let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

    it 'finds metadata for the image' 


    context 'with a file that has a general (untyped) note' do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports notes' 

    end

    context 'with a file that has a publisher', skip: "need a record with originInfo" do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports publisher' 

    end

    context 'with a file that has a photographer', skip: "we're not doing relators beyond contributor" do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports photographer' 

    end

    it 'imports contributor' 


    it 'imports language' 


    it 'imports resource_type' 


    it 'imports digital origin', skip: "Need a record with digital origin" 


    context 'with a file that has coordinates', skip: 'Need metadata with geo data' do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports coordinates' 

    end

    it 'finds metadata for the collection' 


    context 'with a range of dateCreated', skip: "no dates on this record" do
      it 'imports created' 

    end

    context 'without date_created' do
      let(:parser) { described_class.new(nil) }
      let(:xml) do
        "<mods #{ns_decl}><originInfo><dateValid encoding=\"w3cdtf\">1989-12-01</dateValid></originInfo></mods>"
      end

      before { allow(parser).to receive(:mods).and_return(Mods::Record.new.from_str(xml)) }

      it "doesn't return a set of empty date attributes (which would cause an empty TimeSpan to be created)" 

    end

    context 'with a file that has a range of dateIssued', skip: "no dates on this record" do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports issued' 

    end

    context 'with a file that has a single dateIssued', skip: "no dates on this record" do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'imports issued' 

    end

    context 'with date_copyrighted', skip: "no dates on this record" do
      let(:parser) { described_class.new(nil) }
      let(:xml) do
        "<mods #{ns_decl}><originInfo><copyrightDate encoding=\"w3cdtf\">1985-12-01</copyrightDate></originInfo></mods>"
      end

      before { allow(parser).to receive(:mods).and_return(Mods::Record.new.from_str(xml)) }
      it 'imports date_copyrighted' 

    end

    context 'with dateValid' do
      let(:parser) { described_class.new(nil) }
      let(:xml) do
        "<mods #{ns_decl}><originInfo><dateValid encoding=\"w3cdtf\">1989-12-01</dateValid></originInfo></mods>"
      end

      before { allow(parser).to receive(:mods).and_return(Mods::Record.new.from_str(xml)) }
      it 'imports date_valid' 

    end

    context 'with a file that has an alternative title', skip: "Need a record with alt title" do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'distinguishes between title and alternative title' 

    end

    context 'with a file that has placeTerm', skip: 'file has no originInfo' do
      let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

      it 'reads the place' 

    end
  end

  describe '#attributes for a Collection record' do
    let(:file) { 'spec/fixtures/mods/shpc/kx532cb7981.mods' }

    it 'finds the metadata' 

  end
end

