# frozen_string_literal: true

Capybara::SpecHelper.spec '#attach_file' do
  before do
    @test_file_path = File.expand_path('../fixtures/test_file.txt', File.dirname(__FILE__))
    @another_test_file_path = File.expand_path('../fixtures/another_test_file.txt', File.dirname(__FILE__))
    @test_jpg_file_path = File.expand_path('../fixtures/capybara.jpg', File.dirname(__FILE__))
    @no_extension_file_path = File.expand_path('../fixtures/no_extension', File.dirname(__FILE__))
    @session.visit('/form')
  end

  context 'with normal form' do
    it 'should set a file path by id' 


    it 'should set a file path by label' 


    it 'should be able to set on element if no locator passed' 


    it 'casts to string' 

  end

  context 'with multipart form' do
    it 'should set a file path by id' 


    it 'should set a file path by label' 


    it 'should not break if no file is submitted' 


    it 'should send content type text/plain when uploading a text file' 


    it 'should send content type image/jpeg when uploading an image' 


    it 'should not break when uploading a file without extension' 


    it 'should not break when using HTML5 multiple file input' 


    it 'should not break when using HTML5 multiple file input uploading multiple files' 


    it 'should not send anything when attaching no files to a multiple upload field' 


    it 'should not append files to already attached' 


    it 'should fire change once when uploading multiple files from empty', requires: [:js] do
      @session.visit('with_js')
      @session.attach_file('multiple-file',
                           [@test_file_path, @another_test_file_path].map { |f| with_os_path_separators(f) })
      expect(@session).to have_css('.file_change', count: 1)
    end

    it 'should fire change once for each set of files uploaded', requires: [:js] do
      @session.visit('with_js')
      @session.attach_file('multiple-file', [@test_jpg_file_path].map { |f| with_os_path_separators(f) })
      @session.attach_file('multiple-file',
                           [@test_file_path, @another_test_file_path].map { |f| with_os_path_separators(f) })
      expect(@session).to have_css('.file_change', count: 2)
    end
  end

  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context "with a path that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with :exact option' do
    it 'should set a file path by partial label when false' 


    it 'should not allow partial matches when true' 

  end

  context 'with :make_visible option', requires: %i[js es_args] do
    it 'applies a default style change when true' 


    it 'accepts a hash of styles to be applied' 


    it 'raises an error when the file input is not made visible' 


    it 'resets the style when done' 

  end

  private

  def with_os_path_separators(path)
    Gem.win_platform? ? path.to_s.tr('/', '\\') : path.to_s
  end
end

