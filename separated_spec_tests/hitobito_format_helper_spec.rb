# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe FormatHelper do

  include I18nHelper
  include UtilityHelper
  include CrudTestHelper
  include NestedForm::ViewHelper

  before(:all) do
    reset_db
    setup_db
    create_test_data
  end

  after(:all) { reset_db }

  # define some test format_ methods
  def format_size(obj)
    "#{f(obj.size)} items"
  end

  def format_string_size(obj)
    "#{f(obj.size)} chars"
  end

  describe '#labeled' do
    context 'regular' do
      subject { labeled('label') { 'value' } }

      it { is_expected.to be_html_safe }
      # its(:squish) { should == '<div class="labeled"> <label>label</label> <div class="value">value</div> </div>'.gsub('"', "'") }
      its(:squish) { should == '<dt class="muted">label</dt> <dd>value</dd>'.gsub('"', "'") }
    end

    context 'with empty value' do
      subject { labeled('label') { '' } }

      it { is_expected.to be_html_safe }
      its(:squish) { should == '<dt class="muted">label</dt> <dd>'.gsub('"', "'") + FormatHelper::EMPTY_STRING + '</dd>' }
    end

    context 'with unsafe value' do
      subject { labeled('label') { 'value <unsafe>' } }

      it { is_expected.to be_html_safe }
      its(:squish) { should == '<dt class="muted">label</dt> <dd>value &lt;unsafe&gt;</dd>'.gsub('"', "'") }
    end
  end

  describe '#labeled_attr' do
    subject { labeled_attr('foo', :size) }

    it { is_expected.to be_html_safe }
    its(:squish) {  should == '<dt class="muted">Size</dt> <dd>3 chars</dd>'.gsub('"', "'") }
  end

  describe '#f' do

    context 'Fixnums' do
      it 'should print small values unchanged' 


      it 'should print large values without delimiters' 

    end

    context 'Floats' do
      it 'should add two digits' 


      it 'should truncate to two digits' 


      it 'should add delimiters' 

    end

    context 'Booleans' do
      it 'true should print yes' 


      it 'false should print no' 

    end

    context 'nil' do
      it 'should print an empty string' 

    end

    context 'Strings' do
      it 'should print regular strings unchanged' 


      it 'should not be html safe' 

    end

  end

  describe '#format_attr' do
    it 'should use #f' 


    it 'should use object attr format method if it exists' 


    it 'should use general attr format method if it exists' 


    it 'should format empty belongs_to' 


    it 'should format existing belongs_to' 


    it 'should format existing has_many' 

  end

  describe '#fnumber' do
    context 'Fixnums' do
      it 'should print small values unchanged' 


      it 'should print large values with delimiters' 

    end

    context 'Floats' do
      it 'should add two digits' 


      it 'should truncate to two digits' 


      it 'should add delimiters' 

    end

    context 'nil' do
      it 'should print an empty string' 

    end

    context 'Strings' do
      it 'should print small integer strings unchanged' 


      it 'should print large integer strings with delimiters' 


      it 'should convert any other string to integer' 

    end
  end

  describe '#column_type' do
    let(:model) { crud_test_models(:AAAAA) }

    it 'should recognize types' 

  end

  describe '#format_type' do
    let(:model) { crud_test_models(:AAAAA) }

    it 'should format integers' 


    it 'should format floats' 


    it 'should format decimals' 


    it 'should format dates' 


    it 'should format times' 


    it 'should format datetimes' 


    it 'should format texts' 


    it 'should escape texts' 


    it 'should format empty texts' 

  end

  describe '#content_tag_nested' do

    it 'should escape safe content' 


    it 'should escape unsafe content' 


    it 'should simply join without block' 

  end

  describe '#safe_join' do
    it 'should works as super without block' 


    it 'should collect contents for array' 

  end

  describe '#captionize' do
    it 'should handle symbols' 


    it 'should render all upper case' 


    it 'should render human attribute name' 

  end

  describe '#translate_inheritable' do
    before { @controller = CrudTestModelsController.new }

    before { I18n.backend.store_translations :de, global: { test_key: 'global' } }
    subject { ti(:test_key) }

    it { is_expected.to eq('global') }

    context 'with list key' do
      before { I18n.backend.store_translations :de, list: { global: { test_key: 'list global' } } }
      it { is_expected.to eq('list global') }

      context 'and list action key' do
        before { I18n.backend.store_translations :de, list: { index: { test_key: 'list index' } } }
        it { is_expected.to eq('list index') }

        context 'and crud global key' do
          before { I18n.backend.store_translations :de, crud: {  global: { test_key: 'crud global' } } }
          it { is_expected.to eq('crud global') }

          context 'and crud action key' do
            before { I18n.backend.store_translations :de, crud: {  index: { test_key: 'crud index' } } }
            it { is_expected.to eq('crud index') }

            context 'and controller global key' do
              before { I18n.backend.store_translations :de, crud_test_models: {  global: { test_key: 'test global' } } }
              it { is_expected.to eq('test global') }

              context 'and controller action key' do
                before { I18n.backend.store_translations :de, crud_test_models: {  index: { test_key: 'test index' } } }
                it { is_expected.to eq('test index') }
              end
            end
          end
        end
      end
    end
  end

  describe '#translate_association' do
    let(:assoc) { CrudTestModel.reflect_on_association(:companion) }
    subject { ta(:test_key, assoc) }

    before { I18n.backend.store_translations :de, global: { associations: { test_key: 'global' } } }
    it { is_expected.to eq('global') }

    context 'with model key' do
      before do
        I18n.backend.store_translations :de,
                                        activerecord: {
                                          associations: {
                                            crud_test_model: {
                                              test_key: 'model' } } }
      end

      it { is_expected.to eq('model') }

      context 'and assoc key' do
        before do
          I18n.backend.store_translations :de,
                                          activerecord: {
                                            associations: {
                                              models: {
                                                crud_test_model: {
                                                  companion: {
                                                    test_key: 'companion' } } } } }
        end

        it { is_expected.to eq('companion') }
        it 'should use global without assoc' 

      end
    end
  end
end

