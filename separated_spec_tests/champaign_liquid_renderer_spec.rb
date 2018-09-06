# frozen_string_literal: true

require 'rails_helper'

describe LiquidRenderer do
  let!(:body_partial) { create :liquid_partial, title: 'body_text', content: '<p>{{ content }}</p>' }
  let(:liquid_layout) { create :liquid_layout, content: "<h1>{{ title }}</h1> {% include 'body_text' %}" }
  let(:page)          { create :page, liquid_layout: liquid_layout, content: 'sliiiiide to the left' }
  let(:renderer)      { LiquidRenderer.new(page) }
  let(:cache_helper)  { double(:cache_helper, key_for_data: 'foo', key_for_markup: 'bar') }

  describe 'new' do
    it 'receives the correct arguments' 


    it 'requires only page and layout' 


    it 'does not receive arbitrary keyword arguments' 


    describe 'setting locale' do
      describe 'leaves english as the locale when page' do
        it 'has no language' 


        it 'has a nonsense language code' 


        it 'has an unsupported language code' 

      end
    end
  end

  describe 'render' do
    it 'returns an html string with the title' 


    it 'renders the partial with the content' 


    describe 'handles a missing translation' do
      it 'by raising an error in test' 


      it 'by raising an error in development' 


      it 'by showing the best effort on production' 

    end

    it 'fills in localized string' 

  end

  describe 'default_markup' do
    it 'is not a method' 

  end

  describe 'markup_data' do
    let(:page) do
      create(:page,
             follow_up_liquid_layout: create(:liquid_layout),
             follow_up_page:          create(:page))
    end
    let(:fake_images) do
      [instance_double(Image, content: nil, content_file_name: 'smile.jpg'),
       instance_double(Image, content: nil, content_file_name: 'hearts.png')]
    end
    let(:empty_img_hash) { { 'urls' => { 'large' => '', 'small' => '', 'original' => '' } } }

    subject { renderer.send(:markup_data) }

    it 'has string keys' 


    it 'has expected keys' 


    it 'has a follow_up_url' 


    it 'gives image urls in a list for images' 


    it 'gives image urls in a hash for named_images' 

  end

  describe 'personalization_data' do
    it 'should have string keys' 


    it 'should have expected keys' 


    describe 'show_direct_debit' do
      let(:location) { instance_double('Geocoder::Result::Freegeoip', data: { country_code: 'US' }, country_code: 'US') }
      let(:member) { build :member, country: 'DE' }
      let(:form) { create :form_with_email_and_name }
      let(:fundraiser) { create :plugins_fundraiser, page: page, form: form }

      before :each do
        create :plugins_fundraiser, page: page, form: form, recurring_default: 'recurring'
        allow(DirectDebitDecider).to receive(:decide).and_return(true)
      end

      it 'calls DirectDebitDecider with url_params[:recurring_default] if both present' 


      it 'calls DirectDebitDecider with fundraiser.recurring_default if no url_params[:recurring_default]' 


      it 'calls DirectDebitDecider with location country and member country' 

    end

    describe 'outstanding_fields' do
      it 'is [] if it has no plugins' 


      it "is [] if it's plugins don't have forms" 


      it 'has the fields from one plugin form' 


      it "checks with the member's liquid data" 


      it 'has from both plugin forms' 

    end

    describe 'donation_bands' do
      let(:stubbed_amounts) { [1, 2, 3, 4, 5] }
      let(:stubbed_conversion) do
        %w[GBP EUR AUD NZD CAD CHF].inject({}) do |memo, a|
          memo[a] = stubbed_amounts
          memo
        end
      end

      before :each do
        allow(PaymentProcessor::Currency).to receive(:convert)
      end

      it 'is nil if it has no plugins and no url_params' 


      it "is {} if it's plugins don't have donation bands and no url_params" 


      it "has the fundraiser's donation band if no url_param" 


      it "has the first fundraiser's donation band if multiple" 


      it "has the fundraiser's donation band if url_param nonsensical" 


      it 'uses the url_params donation band if passed' 

    end

    describe 'location' do
      let(:location) { instance_double('Geocoder::Result::Freegeoip', data: { country_code: 'US' }, country_code: 'US') }

      before :each do
        allow(Donations::Utils).to receive(:currency_from_country_code) { 'USD' }
      end

      it 'returns the location its passed' 


      it 'calls currency_from_country_code with member country' 


      it 'calls currency_from_country_code with location country if member has none' 


      it 'sets location.country to member country if present' 


      it 'sets location.country to location.country_code if member has no country' 

    end

    describe 'member' do
      it 'gives email as welcome name if no name' 


      it 'gives first name and last name if available' 

    end

    describe 'form_values' do
      let(:form1) { create :form_with_email_and_optional_country }
      let(:form2) { create :form_with_phone_and_country }
      let(:fundraiser) { create :plugins_fundraiser, page: page, form: form1 }
      let(:petition) { create :plugins_petition, page: page, form: form2 }
      let(:member) { build :member, first_name: 'Lemony', last_name: 'Snicket', email: 'sup@dude.com' }
      let(:url_params) { { controller: 'actions', country: 'NI', phone: '6697729' } }

      it 'has values from url_params and member_data filtered by keys from both forms' 


      it 'allows all the hidden field params' 

    end

    describe 'thermometer' do
      it 'is nil if no plugins' 


      it 'is nil if no thermometer plugin' 


      it "is serializes the thermometer plugin's data" 


      it 'is uses the first if multiple thermometer plugins' 

    end

    describe 'action_count' do
      it 'serializes page.action_count' 

    end
  end

  describe LiquidRenderer::Cache do
    subject { LiquidRenderer::Cache.new('foo', 'bar') }
    let(:partial) { [double(:partial, cache_key: 'foobar')] }

    describe '.invalidate' do
      it 'increments invalidator seed' 

    end

    describe '#key_for_markup' do
      it 'follows pattern' 

    end
  end
end

