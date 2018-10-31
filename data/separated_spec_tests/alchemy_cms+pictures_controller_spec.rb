# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples :redirecting_to_picture_library do
  let(:params) do
    {
      filter: 'latest',
      page: 2,
      q: {name_or_image_file_name_cont: 'kitten'},
      size: 'small',
      tagged_with: 'cat'
    }
  end

  it 'redirects to index keeping all query, filter and page params' 

end

module Alchemy
  describe Admin::PicturesController do
    routes { Alchemy::Engine.routes }

    before do
      authorize_user(:as_admin)
    end

    describe '#index' do
      context 'with search params' do
        let!(:picture_1) { create(:alchemy_picture, name: 'cute kitten') }
        let!(:picture_2) { create(:alchemy_picture, name: 'nice beach') }

        it 'assigns @pictures with filtered pictures' 

      end

      context 'with filter params' do
        let!(:picture_1) { create(:alchemy_picture) }
        let!(:picture_2) { create(:alchemy_picture, tag_list: %w(kitten)) }

        it 'assigns @pictures with filtered pictures' 

      end

      context 'with tag params' do
        let!(:picture_1) { create(:alchemy_picture, tag_list: %w(water)) }
        let!(:picture_2) { create(:alchemy_picture, tag_list: %w(kitten)) }
        let!(:picture_3) { create(:alchemy_picture, tag_list: %w(water nature)) }

        it 'assigns @pictures with filtered pictures' 

      end

      context 'with multiple tag params' do
        let!(:picture_1) { create(:alchemy_picture, tag_list: %w(water)) }
        let!(:picture_2) { create(:alchemy_picture, tag_list: %w(water nature)) }

        it 'assigns @pictures with filtered pictures' 

      end

      it 'assigns @size to default value' 


      context "with params[:size] set to 'large'" do
        it 'assigns @size to large' 

      end

      context "when params[:content_id]" do
        context "is set" do
          it "for html requests it renders the archive_overlay partial" 


          it "for ajax requests it renders the archive_overlay template" 

        end

        context "is not set" do
          it "should render the default index view" 

        end
      end
    end

    describe '#create' do
      subject { post :create, params: params }

      let(:params)  { {picture: {name: ''}} }
      let(:picture) { mock_model('Picture', humanized_name: 'Cute kittens', to_jq_upload: {}) }

      context 'with passing validations' do
        before do
          expect(Picture).to receive(:new).and_return(picture)
          expect(picture).to receive(:name=).and_return('Cute kittens')
          expect(picture).to receive(:name).and_return('Cute kittens')
          expect(picture).to receive(:save).and_return(true)
        end

        it "renders json response with success message" 

      end

      context 'with failing validations' do
        it_behaves_like 'having a json uploader error message'
      end
    end

    describe '#show' do
      let(:picture) { create(:alchemy_picture, name: 'kitten') }

      it 'assigns @picture' 


      context 'with assignments' do
        let!(:page) { create(:alchemy_page) }
        let!(:element) { create(:alchemy_element, page: page) }
        let!(:content) { create(:alchemy_content, element: element) }
        let!(:essence) { create(:alchemy_essence_picture, content: content, picture: picture) }

        it 'assigns all essence pictures having an assignment to @assignments' 

      end

      context 'with previous picture existing' do
        let!(:previous) { create(:alchemy_picture, name: 'abraham') }

        it 'assigns @previous to previous picture' 

      end

      context 'with next picture existing' do
        let!(:next_picture) { create(:alchemy_picture, name: 'zebra') }

        it 'assigns @next to next picture' 

      end
    end

    describe '#edit_multiple' do
      let(:pictures) { [mock_model('Picture', tag_list: 'kitten')] }
      before { expect(Picture).to receive(:where).and_return(pictures) }

      it 'assigns pictures instance variable' 


      it 'assigns tags instance variable' 

    end

    describe '#update' do
      subject do
        put :update, params: {id: 1, picture: {name: ''}}, xhr: true
      end

      let(:picture) { build_stubbed(:alchemy_picture, name: 'Cute kitten') }

      before do
        expect(Picture).to receive(:find).and_return(picture)
      end

      context 'with passing validations' do
        before do
          expect(picture).to receive(:update).and_return(true)
        end

        it "sets success notice" 

      end

      context 'with failing validations' do
        before do
          expect(picture).to receive(:update).and_return(false)
        end

        it "sets error notice" 

      end
    end

    describe '#update_multiple' do
      let(:picture)  { build_stubbed(:alchemy_picture) }
      let(:pictures) { [picture] }

      before do
        expect(Picture).to receive(:find).and_return(pictures)
        expect(picture).to receive(:save!).and_return(true)
      end

      it "loads and assigns pictures" 


      it_behaves_like :redirecting_to_picture_library do
        let(:subject) { post(:update_multiple, params: params) }
      end
    end

    describe "#delete_multiple" do
      subject { delete :delete_multiple, params: {picture_ids: picture_ids} }

      it_behaves_like :redirecting_to_picture_library do
        let(:subject) do
          delete :delete_multiple, params: {
            picture_ids: %w(1 2)
          }.merge(params)
        end
      end

      let(:deletable_picture) do
        mock_model('Picture', name: 'pic of the pig', deletable?: true)
      end

      let(:not_deletable_picture) do
        mock_model('Picture', name: 'pic of the chick', deletable?: false)
      end

      context "no picture_ids given" do
        let(:picture_ids) { '' }

        it "should give a warning about not deleting any pictures" 

      end

      context "picture_ids given" do
        context "all are deletable" do
          let(:picture_ids) { deletable_picture.id.to_s }

          before do
            allow(Picture).to receive(:find).and_return([deletable_picture])
          end

          it "should delete the pictures give a notice about deleting them" 

        end

        context "deletable and not deletable" do
          let(:picture_ids) { "#{deletable_picture.id},#{not_deletable_picture.id}" }

          before do
            allow(Picture).to receive(:find).and_return([deletable_picture, not_deletable_picture])
          end

          it "should give a warning for the non deletable pictures and delete the others" 

        end

        context 'with error happening' do
          let(:picture_ids) { deletable_picture.id.to_s }

          before do
            expect(Picture).to receive(:find).and_raise('yada')
          end

          it "sets error message" 


          it "redirects to index" 

        end
      end
    end

    describe '#destroy' do
      let(:picture) { build_stubbed(:alchemy_picture, name: 'Cute kitten') }

      before do
        expect(Picture).to receive(:find).and_return(picture)
      end

      it "destroys the picture and sets and success message" 


      context 'if an error happens' do
        before do
          expect(picture).to receive(:destroy).and_raise('yada')
        end

        it "shows error notice" 


        it "redirects to index" 

      end

      it_behaves_like :redirecting_to_picture_library do
        let(:subject) { delete :destroy, params: {id: picture.id}.merge(params) }
      end
    end

    describe '#items_per_page' do
      subject { controller.send(:items_per_page) }

      before do
        expect(controller).to receive(:params).at_least(:once) { params }
      end

      context 'in overlay' do
        let(:params) { {content_id: :id, size: size} }

        context 'with params[:size] set to medium' do
          let(:size) { 'medium' }

          it { is_expected.to eq(9) }
        end

        context 'with params[:size] set to small' do
          let(:size) { 'small' }

          it { is_expected.to eq(25) }
        end

        context 'with params[:size] set to large' do
          let(:size) { 'large' }

          it { is_expected.to eq(4) }
        end
      end

      context 'in archive' do
        let(:params) { {size: size} }

        context 'with params[:size] set to medium' do
          let(:size) { 'medium' }

          it { is_expected.to eq(20) }

          context 'with cookie set' do
            before do
              @request.cookies[:alchemy_pictures_per_page] = 2
            end

            it { is_expected.to eq(2) }

            context 'with params[:per_page] given' do
              let(:params) { {per_page: 8, size: size} }

              it { is_expected.to eq(8) }
            end
          end
        end

        context 'with params[:size] set to small' do
          let(:size) { 'small' }

          it { is_expected.to eq(60) }
        end

        context 'with params[:size] set to large' do
          let(:size) { 'large' }

          it { is_expected.to eq(12) }
        end
      end
    end
  end
end

