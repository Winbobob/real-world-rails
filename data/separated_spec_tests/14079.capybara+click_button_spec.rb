# frozen_string_literal: true

Capybara::SpecHelper.spec '#click_button' do
  before do
    @session.visit('/form')
  end

  it 'should wait for asynchronous load', requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    @session.click_button('New Here')
  end

  it 'casts to string' 


  context 'with multiple values with the same name' do
    it 'should use the latest given value' 

  end

  context 'with a form that has a relative url as an action' do
    it 'should post to the correct url' 

  end

  context 'with a form that has no action specified' do
    it 'should post to the correct url' 

  end

  context 'with value given on a submit button' do
    context 'on a form with HTML5 fields' do
      before do
        @session.click_button('html5_submit')
        @results = extract_results(@session)
      end

      it 'should serialise and submit search fields' 


      it 'should serialise and submit email fields' 


      it 'should serialise and submit url fields' 


      it 'should serialise and submit tel fields' 


      it 'should serialise and submit color fields' 

    end

    context 'on an HTML4 form' do
      before do
        @session.click_button('awesome')
        @results = extract_results(@session)
      end

      it 'should serialize and submit text fields' 


      it 'should escape fields when submitting' 


      it 'should serialize and submit password fields' 


      it 'should serialize and submit hidden fields' 


      it 'should not serialize fields from other forms' 


      it 'should submit the button that was clicked, but not other buttons' 


      it 'should serialize radio buttons' 


      it "should default radio value to 'on' if none specified" 


      it 'should serialize check boxes' 


      it "should default checkbox value to 'on' if none specififed" 


      it 'should serialize text areas' 


      it 'should serialize select tag with values' 


      it 'should serialize select tag without values' 


      it 'should serialize first option for select tag with no selection' 


      it 'should not serialize a select tag without options' 


      it 'should convert lf to cr/lf in submitted textareas' 


      it 'should not submit disabled fields' 

    end
  end

  context 'input type=submit button' do
    it 'should submit by button id' 


    it 'should submit by button title' 


    it 'should submit by partial title', :exact_false do
      @session.click_button('What an Awesome')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with fields associated with the form using the form attribute', requires: [:form_attribute] do
    before do
      @session.click_button('submit_form1')
      @results = extract_results(@session)
    end

    it 'should serialize and submit text fields' 


    it 'should serialize text areas' 


    it 'should serialize select tags' 


    it 'should not serliaze fields associated with a different form' 

  end

  context 'with submit button outside the form defined by <button> tag', requires: [:form_attribute] do
    before do
      @session.click_button('outside_button')
      @results = extract_results(@session)
    end

    it 'should submit the associated form' 


    it 'should submit the button that was clicked, but not other buttons' 

  end

  context "with submit button outside the form defined by <input type='submit'> tag", requires: [:form_attribute] do
    before do
      @session.click_button('outside_submit')
      @results = extract_results(@session)
    end

    it 'should submit the associated form' 


    it 'should submit the button that was clicked, but not other buttons' 

  end

  context 'with submit button for form1 located within form2', requires: [:form_attribute] do
    it 'should submit the form associated with the button' 

  end

  context 'with submit button not associated with any form' do
    it 'should not error when clicked' 

  end

  context 'with alt given on an image button' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('hai')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with value given on an image button' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('kay')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with id given on an image button' do
    it 'should submit the associated form' 

  end

  context 'with title given on an image button' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('Okay 556')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with text given on a button defined by <button> tag' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('Click')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with id given on a button defined by <button> tag' do
    it 'should submit the associated form' 


    it 'should serialize and send GET forms' 

  end

  context 'with value given on a button defined by <button> tag' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('ck_me')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with title given on a button defined by <button> tag' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('Click Title')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context 'with descendant image alt given on a button defined by <button> tag' do
    it 'should submit the associated form' 


    it 'should work with partial matches', :exact_false do
      @session.click_button('se eating h')
      expect(extract_results(@session)['first_name']).to eq('John')
    end
  end

  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with formaction attribute on button' do
    it 'should submit to the formaction attribute' 

  end

  context 'with formmethod attribute on button' do
    it 'should submit to the formethod attribute' 

  end

  it 'should serialize and send valueless buttons that were clicked' 


  it 'should send button in document order' 


  it 'should not send image buttons that were not clicked' 


  it 'should serialize and send GET forms' 


  it 'should follow redirects' 


  it 'should follow temporary redirects that maintain method' 


  it 'should follow permanent redirects that maintain method' 


  it 'should post pack to the same URL when no action given' 


  it 'should post pack to the same URL when blank action given' 


  it 'ignores disabled buttons' 


  it 'should encode complex field names, like array[][value]' 


  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end
end

