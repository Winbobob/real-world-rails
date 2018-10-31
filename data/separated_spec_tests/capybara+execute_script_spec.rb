# frozen_string_literal: true

Capybara::SpecHelper.spec '#execute_script', requires: [:js] do
  it 'should execute the given script and return nothing' 


  it 'should be able to call functions defined in the page' 


  it 'should pass arguments to the script', requires: %i[js es_args] do
    @session.visit('/with_js')
    @session.execute_script("document.getElementById('change').textContent = arguments[0]", 'Doodle Funk')
    expect(@session).to have_css('#change', text: 'Doodle Funk')
  end

  it 'should support passing elements as arguments to the script', requires: %i[js es_args] do
    @session.visit('/with_js')
    el = @session.find(:css, '#change')
    @session.execute_script('arguments[1].textContent = arguments[0]', 'Doodle Funk', el)
    expect(@session).to have_css('#change', text: 'Doodle Funk')
  end
end

