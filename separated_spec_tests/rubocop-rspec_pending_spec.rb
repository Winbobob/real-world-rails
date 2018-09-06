RSpec.describe RuboCop::Cop::RSpec::Pending do
  subject(:cop) { described_class.new }

  it 'flags xcontext' 


  it 'flags xdescribe' 


  it 'flags xexample' 


  it 'flags xfeature' 


  it 'flags xit' 


  it 'flags xscenario' 


  it 'flags xspecify' 


  it 'flags skip inside of an it' 
      it 'test' 

    RUBY
  end

  it 'flags skip blocks' 


  it 'flags blocks with skip symbol metadata' 


  it 'flags blocks with pending symbol metadata' 


  it 'flags blocks with skip: true metadata' 


  it 'flags pending blocks' 


  it 'flags pending examples when receiver is explicit' 


  it 'does not flag describe' 


  it 'does not flag example' 


  it 'does not flag scenario' 


  it 'does not flag specify' 


  it 'does not flag feature' 


  it 'does not flag context' 


  it 'does not flag it' 


  it 'does not flag it with skip: false metadata' 


  it 'does not flag example_group' 


  it 'does not flag method called pending' 

end

