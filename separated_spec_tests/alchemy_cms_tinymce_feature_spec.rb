# frozen_string_literal: true

require 'spec_helper'

describe 'TinyMCE Editor' do
  before do
    authorize_user(:as_admin)
  end

  it 'base path should be set to tinymce asset folder' 


  context 'with asset host' do
    before do
      expect(ActionController::Base.config).to receive(:asset_host_set?).and_return(true)
    end

    it 'base path should be set to tinymce asset folder' 

  end
end

