# frozen_string_literal: true

Capybara::SpecHelper.spec '#current_scope' do
  before do
    @session.visit('/with_scope')
  end

  context 'when not in a #within block' do
    it 'should return the document' 

  end

  context 'when in a #within block' do
    it 'should return the element in scope' 

  end

  context 'when in a nested #within block' do
    it 'should return the element in scope' 

  end
end

