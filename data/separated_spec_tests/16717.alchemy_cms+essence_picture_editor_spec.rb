# frozen_string_literal: true

require 'spec_helper'

describe "essences/_essence_picture_editor" do
  let(:picture) { stub_model(Alchemy::Picture) }

  let(:essence_picture) do
    stub_model(
      Alchemy::EssencePicture,
      picture: picture,
      caption: 'This is a cute cat'
    )
  end

  let(:content) do
    stub_model(
      Alchemy::Content,
      name: 'image',
      essence_type: 'EssencePicture',
      essence: essence_picture
    )
  end

  let(:options) { Hash.new }

  before do
    view.class.send(:include, Alchemy::Admin::BaseHelper)
    view.class.send(:include, Alchemy::Admin::EssencesHelper)
    allow(view).to receive(:content_label).and_return('')
    allow(view).to receive(:essence_picture_thumbnail).and_return('')
  end

  subject do
    render partial: "alchemy/essences/essence_picture_editor",
      locals: {content: content, options: options}
    rendered
  end

  context "with settings[:deletable] being nil" do
    it 'should not render a button to link and unlink the picture' 

  end

  context "with settings[:deletable] being false" do
    let(:options) do
      {linkable: false}
    end

    it 'should not render a button to link and unlink the picture' 


    it 'but renders the disabled link and unlink icons' 

  end

  context 'with allow_image_cropping? true' do
    before do
      allow(essence_picture).to receive(:allow_image_cropping?) { true }
    end

    it 'shows cropping link' 

  end

  context 'with allow_image_cropping? false' do
    before do
      allow(essence_picture).to receive(:allow_image_cropping?) { false }
    end

    it 'shows disabled cropping link' 

  end
end

