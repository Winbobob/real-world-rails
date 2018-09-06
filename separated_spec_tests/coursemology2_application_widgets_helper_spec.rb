# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationWidgetsHelper, type: :helper do
  def stub_resource_button
    helper.define_singleton_method(:resource_button) do |_, _, _, url_options, _|
      url_options
    end
  end

  let(:instance) { Instance.default }
  with_tenant(:instance) do
    describe '#new_button' do
      let(:announcement) { create(:course_announcement) }
      let(:url_options) { new_course_announcement_path(announcement.course) }
      subject { helper.new_button(url_options) }

      it 'defaults to a btn-primary class' 

      it 'defaults to a file button' 


      context 'when URL options are specified' do
        before { stub_resource_button }
        context 'when a string is specified' do
          it 'is not modified' 

        end

        context 'when a symbol is specified' do
          let(:url_options) { [announcement.course, :announcement] }
          it 'adds a :new at the start of the URL options' 

        end
      end
    end

    describe '#edit_button' do
      let(:announcement) { create(:course_announcement) }
      let(:url_options) { [announcement.course, announcement] }
      subject { helper.edit_button(url_options) }

      it 'defaults to a btn-default class' 

      it 'defaults to a file button' 


      context 'when URL options are specified' do
        before { stub_resource_button }
        context 'when a string is specified' do
          let(:url_options) { edit_course_announcement_path(announcement.course, announcement) }
          it 'is not modified' 

        end

        context 'when a resource is specified' do
          let(:url_options) { [announcement.course, announcement] }
          it 'adds a :edit at the start of the URL options' 

        end
      end
    end

    describe '#delete_button' do
      let(:announcement) { create(:course_announcement) }
      subject { helper.delete_button([announcement.course, announcement]) }
      it 'defaults to a btn-primary class' 

      it 'defaults to a file button' 

      it 'sets the method as delete' 

    end

    describe '#resource_button' do
      let(:announcement) { build(:course_announcement) }
      before { I18n.backend.store_translations(:en, en: { helpers: { buttons: { new: 'new' } } }) }
      after { I18n.backend.store_translations(:en, en: { helpers: { buttons: { new: nil } } }) }

      let(:body) { 'meh' }
      subject do
        helper.send(:resource_button, :new, 'btn-warning', body,
                    [announcement.course, announcement], nil)
      end

      it 'uses the key to determine the translation' 


      it 'adds the key to the button classes' 


      context 'when a block is provided to the body argument' do
        let(:text) { 'block!' }
        let(:body) { proc { text } }
        it 'calls the block to provide the body of the link' 

      end

      context 'when a resource is provided to the url_options argument' do
        it 'gives the title to the link' 

      end
    end

    describe '#deduce_resource_button_class' do
      let(:specified_classes) { [] }
      let(:default_class) { 'ignore' }
      let(:key) { :new }
      subject { helper.send(:deduce_resource_button_class, key, specified_classes, default_class) }

      it 'adds the btn class' 


      it 'adds the key' 


      context 'when a button type is specified' do
        let(:specified_classes) { ['btn-default'] }
        it 'does not add the specified default class' 

      end

      context 'when no button type is specified' do
        it 'adds the specified default class' 

      end
    end

    describe '#deduce_resource_button_title' do
      before { helper.define_singleton_method(:t) { |key, hash| [key] + hash[:default] } }
      let(:announcement) { build(:course_announcement) }
      subject { helper.send(:deduce_resource_button_title, :edit, url_options) }

      context 'when given an array of resources' do
        let(:url_options) { [announcement] }
        it 'picks the last resource' 


        context 'when given an array with an options hash' do
          let(:url_options) { [announcement, test: 'something'] }
          it 'picks the last resource' 

        end
      end

      context 'when given a single resource' do
        let(:url_options) { announcement }
        it 'looks up the model name' 

      end

      context 'when given a symbol' do
        let(:url_options) { :announcement }
        it 'guesses the human name of the symbol' 

      end
    end

    describe '#display_progress_bar' do
      let(:default_class) { 'progress-bar-info' }
      subject { helper.send(:display_progress_bar, 50) }
      it 'returns a progress bar' 


      it 'specifies the correct percentage of the progress bar' 


      it 'defaults to .progress-bar-info' 


      context 'when classes are specified' do
        it 'is reflected in the progress bar' 

      end

      context 'when a block is given' do
        it 'appends the text within the progress bar' 


        it 'renders the block in the context of the helper' 

      end
    end
  end
end

