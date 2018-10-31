RSpec.describe RuboCop::RSpec::Util, '.one' do
  let(:first)  { instance_double(Object)                          }
  let(:array)  { instance_double(Array, one?: true, first: first) }
  let(:client) { Class.new.extend(described_class)                }

  it 'returns first element' 


  it 'fails if the list is empty' 


  it 'fails if the list has more than one element' 

end

