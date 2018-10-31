
# encoding: utf-8

require 'rails_helper'
require 'theme_store/tgz_importer'

describe ThemeStore::TgzImporter do
  before do
    @temp_folder = "#{Pathname.new(Dir.tmpdir).realpath}/discourse_theme_#{SecureRandom.hex}"
  end

  after do
    FileUtils.rm_rf @temp_folder
  end

  it "can import a simple theme" 

end

