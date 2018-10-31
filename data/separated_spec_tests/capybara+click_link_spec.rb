# frozen_string_literal: true

Capybara::SpecHelper.spec '#click_link' do
  before do
    @session.visit('/with_html')
  end

  it 'should wait for asynchronous load', requires: [:js] do
    Capybara.default_max_wait_time = 2
    @session.visit('/with_js')
    @session.click_link('Click me')
    @session.click_link('Has been clicked')
  end

  it 'casts to string' 


  it 'raises any errors caught inside the server', requires: [:server] do
    quietly { @session.visit('/error') }
    expect do
      @session.click_link('foo')
    end.to raise_error(TestApp::TestAppError)
  end

  context 'with id given' do
    it 'should take user to the linked page' 

  end

  context 'with text given' do
    it 'should take user to the linked page' 


    it 'should accept partial matches', :exact_false do
      @session.click_link('abo')
      expect(@session).to have_content('Bar')
    end
  end

  context 'with title given' do
    it 'should take user to the linked page' 


    it 'should accept partial matches', :exact_false do
      @session.click_link('some titl')
      expect(@session).to have_content('Bar')
    end
  end

  context 'with alternative text given to a contained image' do
    it 'should take user to the linked page' 


    it 'should accept partial matches', :exact_false do
      @session.click_link('some imag')
      expect(@session).to have_content('Bar')
    end
  end

  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with :href option given' do
    it 'should find links with valid href' 


    it "should raise error if link wasn't found" 

  end

  context 'with a regex :href option given' do
    it 'should find a link matching an all-matching regex pattern' 


    it 'should find a link matching an exact regex pattern' 


    it 'should find a link matching a partial regex pattern' 


    it "should raise an error if no link's href matched the pattern" 


    context 'href: nil' do
      it 'should not raise an error on links with no href attribute' 


      it 'should raise an error if href attribute exists' 

    end
  end

  it 'should follow relative links' 


  it 'should follow protocol relative links' 


  it 'should follow redirects' 


  it 'should follow redirects back to itself' 


  it 'should add query string to current URL with naked query string' 


  it 'should do nothing on anchor links' 


  it 'should do nothing on URL+anchor links for the same page' 


  it 'should follow link on URL+anchor links for a different page' 


  it 'should follow link on anchor if the path has regex special characters' 


  it 'should raise an error with links with no href' 


  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'without locator' do
    it 'uses options' 

  end

  it 'should return element clicked' 


  it 'can download a file', requires: [:download] do
    # This requires the driver used for the test to be configured
    # to download documents with the mime type "text/csv"
    download_file = File.join(Capybara.save_path, 'download.csv')
    expect(File).not_to exist(download_file)
    @session.click_link('Download Me')
    sleep 2 # allow time for file to download
    expect(File).to exist(download_file)
    FileUtils.rm_rf download_file
  end
end

