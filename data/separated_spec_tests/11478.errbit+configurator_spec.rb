describe Configurator do
  before(:each) do
    allow(ENV).to receive(:[]).and_return(nil)
    allow(ENV).to receive(:[]).with('VARONE').and_return('zoom')
    allow(ENV).to receive(:[]).with('VARTHREE').and_return('zipp')
  end

  it 'takes the first existing env, second item' 


  it 'takes the first existing env, first item' 


  it 'provides nothing for missing variables' 


  it 'overrides existing variables' 


  it 'overrides can refer to other values' 


  it 'extracts symbol values' 


  it 'extracts array values' 


  it 'extracts booleans' 


  it 'extracts numbers' 


  it 'parses empty variables' 

end

