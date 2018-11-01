# frozen_string_literal: true

require 'rails_helper'

describe ActionKitController do
  before do
    allow(ActionKit::Helper).to receive(:check_petition_name_is_available)
  end

  include_examples 'session authentication',
                   [{ post: [:check_slug, params: { slug: 'foo-bar', format: :json }] }]

  describe 'POST#check_slug' do
    subject { post :check_slug, params: { slug: 'foo-bar', format: :json } }

    it 'checks if name is available on AK' 


    it 'checks if name is available on Champaign' 


    it 'returns true if there is no matching page on AK or Champaign' 


    it 'returns false if there is a matching page on AK but not Champaign' 


    it 'returns false if there is a matching page on Champaign but not AK' 


    it 'returns false if there is a matching page on AK and Champaign' 

  end
end

