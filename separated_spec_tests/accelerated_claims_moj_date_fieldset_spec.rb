require_relative '../mocks/mock_template'

feature "moj date fieldset" do

  def expect_equal actual, expected
    expect(actual.gsub("><",">\n<")).to eq(expected.gsub("><",">\n<"))
  end

  context 'emit html' do

    before(:each) do
     allow(SecureRandom).to receive(:hex).with(20).and_return('0123456789abcdef')
    end

    let(:notice)      { Notice.new }
    let(:template)    { MockTemplate.new }
    let(:form)        { LabellingFormBuilder.new(:notice, notice, template, {}) }

    it 'should emit plain vanilla html when no options given' 


    it 'should emit html with fieldset and span css classes added' 


    it 'should emit html with id and css span classes added' 


    it 'should emit html with day month year css classes added' 


    it 'should emit html with other options added' 


    it 'should emit html with a specific example date' 


  end

  def update_data_and_results(date_string, result_fields = {})
    data = load_fixture_data(1)
    data['claim']['notice']['date_served'] = date_string
    expected_data = load_expected_data(1)
    result_fields.each do |field, new_value|
      expected_data[field.to_s] = new_value
    end
    [data, expected_data]
  end

 def expected_date_fieldset options={}
  date_example = options[:date_example] || Date.today.strftime('%d&nbsp;&nbsp;%m&nbsp;&nbsp;%Y')
  fieldset_class = options[:fieldset_class] || ''
  fieldset_id = options[:fieldset_id] || ''
  input_class = options[:input_class] || ''
  input_class_prefix = options[:input_class_prefix] || 'moj-date'
  input_options = options[:input_options] || ''

  str = <<-EOHTML
<fieldset#{fieldset_class}#{fieldset_id}>
  <legend>
    Date Notice Served
    <span class='hint block'>For example,&nbsp;&nbsp;#{date_example}</span>
  </legend>
  <div class="form-date">
    <div class="form-group form-group-day">
      <label for="claim_notice_date_served_3i">Day</label>
      <input  maxlength="2"
              id="claim_notice_date_served_3i"
              name="claim[notice][date_served(3i)]"
              class="#{input_class_prefix}-day#{input_class}"
              #{input_options}
              size="2"
              type="text" />
    </div>
    <div class="form-group form-group-month">
      <label for="claim_notice_date_served_2i">Month</label>
      <input  maxlength="9"
              id="claim_notice_date_served_2i"
              name="claim[notice][date_served(2i)]"
              class="#{input_class_prefix}-month#{input_class}"
              #{input_options}
              size="9"
              type="text" />
    </div>
    <div class="form-group form-group-year">
      <label for="claim_notice_date_served_1i">Year</label>
      <input maxlength="4"
             id="claim_notice_date_served_1i"
             name="claim[notice][date_served(1i)]"
             class="#{input_class_prefix}-year#{input_class}"
             #{input_options}
             size="4"
             type="text" />
    </div>
  </div>
</fieldset>
EOHTML
    squash(str)
  end

  def squash(str)
    str.gsub!("\n", "")
    str.gsub!(/\s+/," ")
    str.gsub!(" <", "<")
    str.gsub!("> ", ">")
    str.gsub!('span><span','span> <span')
    str.gsub!('Served<span', 'Served <span')
    str
  end

end

