RSpec.describe RuboCop::Cop::RSpec::Capybara::CurrentPathExpectation do
  subject(:cop) { described_class.new }

  it 'flags violations for `expect(current_path)`' 


  it 'flags violations for `expect(page.current_path)`' 


  it "doesn't flag a violation for other expectations" 


  it "doesn't flag a violation for other references to `current_path`" 

end

