require 'rails_helper'
require_dependency 'theme_serializer'

describe Admin::ThemesController do
  let(:admin) { Fabricate(:admin) }

  it "is a subclass of AdminController" 


  before do
    sign_in(admin)
  end

  describe '#generate_key_pair' do
    it 'can generate key pairs' 

  end

  describe '#upload_asset' do
    let(:upload) do
      Rack::Test::UploadedFile.new(file_from_fixtures("fake.woff2", "woff2"))
    end

    it 'can create a theme upload' 

  end

  describe '#import' do
    let(:theme_file) do
      Rack::Test::UploadedFile.new(file_from_fixtures("sam-s-simple-theme.dcstyle.json", "json"))
    end

    let(:image) do
      file_from_fixtures("logo.png")
    end

    it 'can import a theme with an upload' 


    it 'imports a theme' 

  end

  describe '#index' do
    it 'correctly returns themes' 

  end

  describe '#create' do
    it 'creates a theme' 

  end

  describe '#update' do
    let(:theme) { Fabricate(:theme) }

    it 'can change default theme' 


    it 'can unset default theme' 


    it 'updates a theme' 


    it 'returns the right error message' 

  end

  describe '#destroy' do
    let(:theme) { Fabricate(:theme) }

    it "deletes the field's javascript cache" 

  end
end

