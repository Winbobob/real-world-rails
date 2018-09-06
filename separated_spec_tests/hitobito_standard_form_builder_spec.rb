# encoding: utf-8

require 'spec_helper'

describe 'StandardFormBuilder' do

  include FormatHelper
  include I18nHelper
  include FormHelper
  include UtilityHelper
  include CrudTestHelper
  include LayoutHelper

  before(:all) do
    reset_db
    setup_db
    create_test_data
  end

  after(:all) { reset_db }

  let(:entry) { CrudTestModel.first }
  let(:form)  { StandardFormBuilder.new(:entry, entry, self, {}) }

  describe '#input_field' do

    { name: :string_field,
      password: :password_field,
      remarks: :text_area,
      children: :integer_field,
      human: :boolean_field,
      birthdate: :date_field,
      gets_up_at: :time_field,
      companion_id: :belongs_to_field,
      other_ids: :has_many_field,
      more_ids: :has_many_field,
    }.each do |attr, method|
      it "dispatches #{attr} attr to #{method}" 


      it { expect(form.input_field(attr)).to be_html_safe }
    end

  end

  describe '#labeled_input_fields' do
    subject { form.labeled_input_fields(:name, :remarks, :children) }

    it { is_expected.to be_html_safe }
    it { is_expected.to include(form.input_field(:name)) }
    it { is_expected.to include(form.input_field(:remarks)) }
    it { is_expected.to include(form.input_field(:children)) }
  end

  describe '#labeled_input_field' do
    context 'when required' do
      subject { form.labeled_input_field(:name) }
      it { is_expected.to include(StandardFormBuilder::REQUIRED_MARK) }
    end

    context 'when not required' do
      subject { form.labeled_input_field(:remarks) }
      it { is_expected.not_to include(StandardFormBuilder::REQUIRED_MARK) }
    end

    context 'with help text' do
      subject { form.labeled_input_field(:name, help: 'Some Help') }
      it { is_expected.to include(form.help_block('Some Help')) }
    end

    context 'with label' do
      subject { form.labeled_input_field(:name, label: 'Some Caption') }
      it { is_expected.to include(form.label(:name, 'Some Caption', class: 'control-label')) }
    end

    context 'with addon' do
      subject { form.labeled_input_field(:name, addon: 'Some Addon') }
      it { is_expected.to match(/class="input-append"/) }
      it { is_expected.to match(/class="add-on"/) }
      it { is_expected.to match(/Some Addon/) }
    end
  end

  describe '#belongs_to_field' do
    it 'has all options by default' 


    it 'with has options from :list option' 


    it 'with empty instance list has no select' 

  end

  describe '#has_and_belongs_to_many_field' do
    let(:others) { OtherCrudTestModel.all[0..1] }

    it 'has all options by default' 


    it 'uses options from :list option if given' 


    it 'uses options form instance variable if given' 


    it 'displays a message for an empty list' 

  end

  describe '#string_field' do
    it 'sets maxlength if attr has a limit' 

  end

  describe '#date_field' do
    it 'sets empty date value' 


    it 'sets original date value' 


    it 'sets changed valid date value' 


    it 'sets changed invalid date value' 

  end

  describe '#label' do
    context 'only with attr' do
      subject { form.label(:gugus_dada) }

      it { is_expected.to be_html_safe }
      it 'provides the same interface as rails' 

    end

    context 'with attr and text' do
      subject { form.label(:gugus_dada, 'hoho') }

      it { is_expected.to be_html_safe }
      it 'provides the same interface as rails' 

    end

  end

  describe '#labeled' do
    context 'in labeled_ method' do
      subject { form.labeled_string_field(:name) }

      it { is_expected.to be_html_safe }
      it 'provides the same interface as rails' 

    end

    context 'with custom content in argument' do
      subject { form.labeled('gugus', "<input type='text' name='gugus' />".html_safe) }

      it { is_expected.to be_html_safe }
      it { is_expected.to match /label [^>]*for.+<input/m }
    end

    context 'with custom content in block' do
      subject { form.labeled('gugus') { "<input type='text' name='gugus' />".html_safe } }

      it { is_expected.to be_html_safe }
      it { is_expected.to match /label [^>]*for.+<input/m }
    end

    context 'with caption and content in argument' do
      subject { form.labeled('gugus', 'Caption', "<input type='text' name='gugus' />".html_safe) }

      it { is_expected.to be_html_safe }
      it { is_expected.to match /label [^>]*for.+>Caption<\/label>.*<input/m }
    end

    context 'with caption and content in block' do
      subject { form.labeled('gugus', 'Caption') { "<input type='text' name='gugus' />".html_safe } }

      it { is_expected.to be_html_safe }
      it { is_expected.to match /label [^>]*for.+>Caption<\/label>.*<input/m }
    end
  end

  describe '#required_mark' do
    it 'is shown for required attrs' 


    it 'is not shown for optional attrs' 


    it 'is not shown for non existing attrs' 

  end

  it 'handles missing methods' 


  context '#respond_to?' do
    it 'returns false for non existing methods' 


    it 'returns true for existing methods' 


    it 'returns true for labeled_ methods' 

  end
end

