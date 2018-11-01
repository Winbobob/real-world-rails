# frozen_string_literal: true

require 'spec_helper'

describe ApplicationsFinder do
  let(:application1) { create(:application, name: 'some_application', owner: nil, redirect_uri: 'http://some_application.url', scopes: '') }
  let(:application2) { create(:application, name: 'another_application', owner: nil, redirect_uri: 'http://other_application.url', scopes: '') }

  describe '#execute' do
    it 'returns an array of applications' 

    it 'returns the application by id' 

  end
end

