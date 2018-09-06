# frozen_string_literal: true

require "spec_helper"

module Alchemy
  describe Admin::EssenceFilesController do
    routes { Alchemy::Engine.routes }

    before do
      authorize_user(:as_admin)
    end

    let(:essence_file) { mock_model('EssenceFile', :attachment= => nil, content: content) }
    let(:content)      { mock_model('Content') }
    let(:attachment)   { mock_model('Attachment') }

    describe '#edit' do
      before do
        expect(EssenceFile).to receive(:find)
          .with(essence_file.id.to_s)
          .and_return(essence_file)
      end

      it "assigns @essence_file with the EssenceFile found by id" 


      it "should assign @content with essence_file's content" 

    end

    describe '#update' do
      let(:essence_file) { create(:alchemy_essence_file) }

      before do
        expect(EssenceFile).to receive(:find).and_return(essence_file)
      end

      it "should update the attributes of essence_file" 

    end

    describe '#assign' do
      let(:content) { create(:alchemy_content) }

      before do
        expect(Content).to receive(:find_by).and_return(content)
        expect(Attachment).to receive(:find_by).and_return(attachment)
        allow(content).to receive(:essence).and_return(essence_file)
      end

      it "should assign @attachment with the Attachment found by attachment_id" 


      it "should assign @content.essence.attachment with the attachment found by id" 


      it "updates the @content.updated_at column" 

    end
  end
end

