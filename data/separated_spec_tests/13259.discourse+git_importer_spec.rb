
# encoding: utf-8

require 'rails_helper'
require 'theme_store/git_importer'

describe ThemeStore::GitImporter do

  context "#import" do

    let(:url) { "https://github.com/example/example.git" }
    let(:ssh_url) { "git@github.com:example/example.git" }
    let(:branch) { "dev" }

    before do
      hex = "xxx"
      SecureRandom.stubs(:hex).returns(hex)
      @temp_folder = "#{Pathname.new(Dir.tmpdir).realpath}/discourse_theme_#{hex}"
      @ssh_folder = "#{Pathname.new(Dir.tmpdir).realpath}/discourse_theme_ssh_#{hex}"
    end

    it "should import from http url" 


    it "should import from ssh url" 


    it "should import branch from http url" 


    it "should import branch from ssh url" 

  end
end

