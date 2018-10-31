# frozen_string_literal: true

Capybara::SpecHelper.spec '#save_screenshot', requires: [:screenshot] do
  let(:alternative_path) { File.join(Dir.pwd, 'save_screenshot_tmp') }
  before do
    @old_save_path = Capybara.save_path
    Capybara.save_path = nil
    @session.visit '/foo'
  end

  after do
    Capybara.save_path = @old_save_path
    FileUtils.rm_rf alternative_path
  end

  it 'generates sensible filename' 


  it 'allows to specify another path' 


  context 'with Capybara.save_path' do
    it 'file is generated in the correct location' 


    it 'relative paths are relative to save_path' 

  end
end

