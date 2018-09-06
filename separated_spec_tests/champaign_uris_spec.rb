# frozen_string_literal: true
require 'rails_helper'

describe 'URI masking' do
  let(:user) { instance_double('User', id: '1') }
  let(:page) { create :page }

  describe 'when no record matches' do
    it 'routes to homepage  if requested by an unauthenticated user' 


    it 'routes to /pages if requested by an authenticated user' 

  end

  it 'renders matching URI record when path is not root' 


  it 'renders matching URI record when path is root' 

end

