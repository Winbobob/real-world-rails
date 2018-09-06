require 'rails_helper'
require_dependency 'theme_serializer'

describe Admin::ThemesController do

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end

    context '.generate_key_pair' do
      it 'can generate key pairs' 

    end

    context '.upload_asset' do
      render_views

      let(:upload) do
        Rack::Test::UploadedFile.new(file_from_fixtures("fake.woff2", "woff2"))
      end

      it 'can create a theme upload' 

    end

    context '.import' do
      let(:theme_file) do
        Rack::Test::UploadedFile.new(file_from_fixtures("sam-s-simple-theme.dcstyle.json", "json"))
      end

      let :image do
        file_from_fixtures("logo.png")
      end

      it 'can import a theme with an upload' 


      it 'imports a theme' 

    end

    context ' .index' do
      it 'correctly returns themes' 

    end

    context ' .create' do
      it 'creates a theme' 

    end

    context ' .update' do
      let(:theme) { Theme.create(name: 'my name', user_id: -1) }

      it 'can change default theme' 


      it 'can unset default theme' 


      it 'updates a theme' 

    end
  end

end

