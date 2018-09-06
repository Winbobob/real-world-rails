require 'rails_helper'

RSpec.describe StaticController, type: :controller do

  context '400' do
    before { get '400' }

    it 'renders 400 static page' 

  end

  context '404' do
    before { get '404' }

    it 'renders 404 static page' 

  end

  context '500' do
    before { get '500' }

    it 'renders 500 static page' 

  end

  context '503' do
    before { get '503' }

    it 'renders 503 static page' 

  end
end

