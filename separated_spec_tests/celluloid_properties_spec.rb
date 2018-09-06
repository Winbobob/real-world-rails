RSpec.describe Celluloid::Internals::Properties do
  let(:default_value) { 42 }
  let(:changed_value) { 43 }

  let(:example_class) do
    Class.new do
      extend Celluloid::Internals::Properties
      property :baz, default: 42
    end
  end

  let(:example_subclass) do
    Class.new(example_class)
  end

  let(:example_subclass_subclass) do
    Class.new(example_subclass)
  end

  it "adds properties to classes" 


  it "allows properties to be inherited" 


  it "allows properties to be deeply inherited" 

end

