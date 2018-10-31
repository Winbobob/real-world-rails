# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::AttachmentsController do
    routes { Alchemy::Engine.routes }

    let(:attachment) { build_stubbed(:alchemy_attachment) }

    let(:file) do
      fixture_file_upload(
        File.expand_path('../../../fixtures/500x500.png', __dir__),
        'image/png'
      )
    end

    before do
      authorize_user(:as_admin)
    end

    describe "#index" do
      it "should always paginate the records" 


      context "when params[:tagged_with] is set" do
        it "should filter the records by tags" 

      end

      context "when params[:content_id]" do
        let(:content) { mock_model(Content) }

        context "is set" do
          it "it renders the archive_overlay partial" 

        end

        context "is not set" do
          it "should render the default index view" 

        end
      end

      describe 'file_type filter' do
        let!(:png) { create(:alchemy_attachment) }

        let!(:jpg) do
          create :alchemy_attachment,
            file: File.new(File.expand_path('../../../fixtures/image3.jpeg', __dir__))
        end

        context 'with params[:file_type]' do
          it 'loads only attachments with matching content type' 

        end
      end
    end

    describe '#show' do
      before do
        expect(Attachment).to receive(:find).and_return(attachment)
      end

      it "renders the show template" 

    end

    describe '#create' do
      subject { post :create, params: params }

      context 'with passing validations' do
        let(:params) { {attachment: {file: file}} }

        it "renders json response with success message" 

      end

      context 'with failing validations' do
        include_context 'with invalid file'

        let(:params) { {attachment: {file: invalid_file}} }

        it_behaves_like 'having a json uploader error message'
      end
    end

    describe '#update' do
      let(:params) do
        {
          id: attachment.id, attachment: {name: ''}
        }
      end

      subject do
        put :update, params: params
      end

      let!(:attachment) { create(:alchemy_attachment) }

      context "when file is passed" do
        let(:file) do
          fixture_file_upload(
            File.expand_path('../../../fixtures/image2.PNG', __dir__),
            'image/png'
          )
        end

        context 'with passing validations' do
          let(:params) do
            {
              id: attachment.id, attachment: {file: file}
            }
          end

          it "renders json response with success message" 


          it "replaces the file" 

        end
      end

      context 'with passing validations' do
        it "redirects to index path" 


        context 'with search params' do
          let(:search_filter_params) do
            {
              q: {name_or_file_name_cont: 'kitten'},
              tagged_with: 'cute',
              file_type: 'pdf',
              page: 2
            }
          end

          subject do
            put :update, params: {
              id: attachment.id, attachment: {name: ''}
            }.merge(search_filter_params)
          end

          it "passes them along" 

        end
      end

      context 'with failing validations' do
        include_context 'with invalid file'

        it "renders edit form" 

      end
    end

    describe '#destroy' do
      before do
        expect(Attachment).to receive(:find).and_return(attachment)
      end

      it "destroys the attachment and sets a success message" 


      context 'with search params' do
        let(:search_filter_params) do
          {
            q: {name_or_file_name_cont: 'kitten'},
            tagged_with: 'cute',
            file_type: 'pdf',
            page: 2
          }
        end

        it "passes them along" 

      end
    end

    describe "#download" do
      before do
        expect(Attachment).to receive(:find).and_return(attachment)
      end

      it "sends the file as download" 

    end
  end
end

