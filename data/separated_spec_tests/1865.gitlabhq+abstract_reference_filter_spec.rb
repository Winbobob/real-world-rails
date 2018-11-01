require 'spec_helper'

describe Banzai::Filter::AbstractReferenceFilter do
  let(:project) { create(:project) }

  describe '#references_per_parent' do
    it 'returns a Hash containing references grouped per parent paths' 

  end

  describe '#parent_per_reference' do
    it 'returns a Hash containing projects grouped per parent paths' 

  end

  describe '#find_for_paths' do
    let(:doc) { Nokogiri::HTML.fragment('') }
    let(:filter) { described_class.new(doc, project: project) }

    context 'with RequestStore disabled' do
      it 'returns a list of Projects for a list of paths' 


      it "return an empty array for paths that don't exist" 

    end

    context 'with RequestStore enabled', :request_store do
      it 'returns a list of Projects for a list of paths' 


      context "when no project with that path exists" do
        it "returns no value" 


        it "adds the ref to the project refs cache" 


        context 'when the project refs cache includes nil values' do
          before do
            # adds { 'nonexistent/project' => nil } to cache
            filter.from_ref_cached('nonexistent/project')
          end

          it "return an empty array for paths that don't exist" 

        end
      end
    end
  end

  describe '#current_parent_path' do
    it 'returns the path of the current parent' 

  end
end

