# frozen_string_literal: true

require 'spec_helper'

describe 'Admin navigation feature' do
  context 'admin users' do
    before { authorize_user(:as_admin) }

    it "can leave the admin area" 

  end

  context 'editor users' do
    before { authorize_user(:as_editor) }

    it "can access the languages page" 

  end
end

