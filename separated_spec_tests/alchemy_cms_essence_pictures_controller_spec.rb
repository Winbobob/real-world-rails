# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::EssencePicturesController do
    routes { Alchemy::Engine.routes }

    before { authorize_user(:as_admin) }

    let(:essence) { EssencePicture.new }
    let(:content) { Content.new }
    let(:picture) { Picture.new }

    describe '#edit' do
      before do
        expect(EssencePicture).to receive(:find).and_return(essence)
        expect(Content).to receive(:find).and_return(content)
      end

      it 'should assign @essence_picture and @content instance variables' 

    end

    describe '#crop' do
      before do
        expect(EssencePicture).to receive(:find).and_return(essence)
      end

      context 'with no picture assigned' do
        before do
          expect(essence).to receive(:picture).at_least(:once).and_return(nil)
        end

        it "renders error message" 

      end

      context 'with picture assigned' do
        let(:default_mask) do
          {
            x1: 0,
            y1: 0,
            x2: 300,
            y2: 250
          }
        end

        before do
          picture.image_file_width = 300
          picture.image_file_height = 250
          expect(essence).to receive(:picture).at_least(:once).and_return(picture)
        end

        context 'with no render_size present in essence' do
          before do
            expect(essence).to receive(:render_size).at_least(:once).and_return(nil)
          end

          context 'with sizes in params' do
            it "sets sizes to given values" 

          end

          context 'with no sizes in params' do
            it "sets sizes to zero" 

          end
        end

        context 'with render_size present in essence' do
          it "sets sizes from these values" 


          context 'when width or height is not fixed' do
            it 'infers the height from the image file preserving the aspect ratio' 


            it 'does not infer the height from the image file preserving the aspect ratio' 

          end

          context 'when width or height is not fixed and an aspect ratio is given' do
            it 'width is given, it infers the height from width and ratio' 


            it 'infers the height from the image file preserving the aspect ratio' 

          end
        end

        context 'no crop sizes present in essence' do
          before do
            expect(essence).to receive(:crop_from).and_return(nil)
            allow(essence).to receive(:crop_size).and_return(nil)
          end

          it "assigns default mask boxes" 

        end

        context 'crop sizes present in essence' do
          let(:mask) { {'x1' => '0', 'y1' => '0', 'x2' => '120', 'y2' => '160'} }

          before do
            allow(essence).to receive(:crop_from).and_return('0x0')
            allow(essence).to receive(:crop_size).and_return('120x160')
          end

          it "assigns cropping boxes" 

        end

        context 'with fixed_ratio set to false' do
          it "sets ratio to false" 

        end

        context 'with fixed_ratio set to a non float string' do
          it "doesn't set a fixed ratio" 

        end

        context 'with no fixed_ratio set in params' do
          it "sets a fixed ratio from sizes" 

        end
      end
    end

    describe '#update' do
      before do
        expect(EssencePicture).to receive(:find).and_return(essence)
        expect(Content).to receive(:find).and_return(content)
      end

      let(:attributes) do
        {
          render_size: '1x1',
          alt_tag: 'Alt Tag',
          caption: 'Caption',
          css_class: 'CSS Class',
          title: 'Title'
        }
      end

      it "updates the essence attributes" 


      it "saves the cropping mask" 

    end

    describe '#assign' do
      let(:content) { create(:alchemy_content) }

      before do
        expect(Content).to receive(:find).and_return(content)
        expect(content).to receive(:essence).at_least(:once).and_return(essence)
        expect(Picture).to receive(:find_by).and_return(picture)
      end

      it "should assign a Picture" 


      it "updates the content timestamp" 

    end
  end
end

