require 'spec_helper'

describe Banzai::Filter::RedactorFilter do
  include ActionView::Helpers::UrlHelper
  include FilterSpecHelper

  it 'ignores non-GFM links' 


  def reference_link(data)
    link_to('text', '', class: 'gfm', data: data)
  end

  it 'skips when the skip_redaction flag is set' 


  context 'with data-project' do
    let(:parser_class) do
      Class.new(Banzai::ReferenceParser::BaseParser) do
        self.reference_type = :test
      end
    end

    before do
      allow(Banzai::ReferenceParser).to receive(:[])
        .with('test')
        .and_return(parser_class)
    end

    context 'valid projects' do
      before do
        allow_any_instance_of(Banzai::ReferenceParser::BaseParser).to receive(:can_read_reference?).and_return(true)
      end

      it 'allows permitted Project references' 

    end

    context 'invalid projects' do
      before do
        allow_any_instance_of(Banzai::ReferenceParser::BaseParser).to receive(:can_read_reference?).and_return(false)
      end

      it 'removes unpermitted references' 


      it 'handles invalid references' 

    end
  end

  context 'with data-issue' do
    context 'for confidential issues' do
      it 'removes references for non project members' 


      it 'removes references for project members with guest role' 


      it 'allows references for author' 


      it 'allows references for assignee' 


      it 'allows references for project members' 


      it 'allows references for admin' 

    end

    it 'allows references for non confidential issues' 

  end

  context "for user references" do
    context 'with data-group' do
      it 'removes unpermitted Group references' 


      it 'allows permitted Group references' 


      it 'handles invalid Group references' 

    end

    context 'with data-user' do
      it 'allows any User reference' 

    end
  end
end

