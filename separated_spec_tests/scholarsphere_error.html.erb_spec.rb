# frozen_string_literal: true

require 'rails_helper'

describe 'error.html.erb' do
  before do
    assign(:presenter, presenter)
    render
  end

  context 'with no exception' do
    let(:presenter) { ErrorPresenter.new }

    it 'displays the page' 

  end

  context 'with an exception' do
    let(:presenter) { ErrorPresenter.new(ActiveFedora::ObjectNotFoundError) }

    it 'displays the page' 

  end
end

