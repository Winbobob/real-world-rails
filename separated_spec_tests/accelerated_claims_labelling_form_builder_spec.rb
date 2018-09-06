require_relative '../mocks/mock_template'

RSpec::Matchers.define :only_show_errors_inside do |expected, opts|
  opts = opts || {}
  opts = { error_css: 'span.error' }.merge(opts)
  match do |actual|
    doc                             = Nokogiri::HTML(actual)
    @count_of_all_error_messages    = doc.css(opts[:error_css]).count
    count_of_correct_error_messages = doc.css(opts[:error_css]).count{ |elem| elem.parent.name == expected.to_s }
    @total_failures                 = @count_of_all_error_messages - count_of_correct_error_messages
    (@total_failures == 0) && (@count_of_all_error_messages > 0)
  end
  failure_message do |actual|
    if @total_failures > 0
      "expected #{pluralize(@count_of_all_error_messages, 'error')} to appear inside a #{expected} tag. #{@total_failures} did not."
    elsif @count_of_all_error_messages <= 0
      "expected error messages, but did not find any."
    end
  end
end

RSpec::Matchers.define :contain_css_selectors do |expected_elements|
  match do |actual|
    doc     = Nokogiri::HTML(actual)
    @errors = []
    [expected_elements].flatten.each do |element|
      @errors << "expected `#{element}`, but did not find it" if doc.css(element).blank?
    end
    @errors.empty?
  end
  failure_message do |actual|
    'generated form had the following errors: ' + @errors.compact.join(", ")
  end
end

describe 'LabellingFormBuilder', :type => :helper  do

  let(:notice)   { double('model', class: double('class').as_null_object).as_null_object }
  let(:template) { MockTemplate.new }
  let(:form)     { LabellingFormBuilder.new('claim[notice]', notice, template, { }) }

  describe '#error_span' do
    it 'can be hidden' 


    it 'has an id for use with aria-labelledby' 

  end

  describe '#moj_postcode_picker' do
    it 'should add default options and call postcode picker' 


    it 'should substitute options which are supplied' 

  end

  describe '#moj_date_fieldset' do
    let(:date_fieldset) { form.moj_date_fieldset :date_served, 'Date notice served', { class: 'date-picker' }, 9.weeks.ago }

    it 'outputs the correct form elements' 


    it 'includes error spans' 

  end

  describe '#text_field_row' do
    let(:row) { form.text_field_row(:expiry_date) }

    it 'outputs the correct form element' 


    it 'shows errors inside the label' 

  end

  describe '#radio_button_field_set' do
    let(:fieldset) {
      form.radio_button_fieldset :notice_served,
      'property',
      class: 'radio'
    }

    before do
      messages = double('error_messages', messages: { notice_served: ['please select whether notice was served'] })
      allow(notice).to receive(:errors) { messages }
    end

    it 'outputs the correct form element' 


    it 'shows errors inside the legend' 


  end

  describe '#text_area_row' do
    subject { form.text_area_row(:full_address) }

    it 'outputs regular text_area_row' 


    it 'shows errors inside the label' 

  end

  describe '#moj_date_fieldset' do

    it 'instantiates an moj_date_fieldsset object with the params and call emit' 


    it 'instantiates an moj_date_fieldset opject with a specific date' 

  end

end


