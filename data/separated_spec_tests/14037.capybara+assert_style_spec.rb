# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_style', requires: [:css] do
  it 'should not raise if the elements style contains the given properties' 


  it "should raise error if the elements style doesn't contain the given properties" 


  it 'should wait for style', requires: %i[css js] do
    @session.visit('/with_js')
    el = @session.find(:css, '#change')
    @session.click_link('Change size')
    expect do
      el.assert_style({ 'font-size': '50px' }, wait: 3)
    end.not_to raise_error
  end
end

