# frozen_string_literal: true

Capybara::SpecHelper.spec '#find_by_id' do
  before do
    @session.visit('/with_html')
  end

  it 'should find any element by id' 


  it 'casts to string' 


  it 'should raise error if no element with id is found' 


  context 'with :visible option' do
    it 'finds invisible elements when `false`' 


    it "doesn't find invisible elements when `true`" 

  end
end

