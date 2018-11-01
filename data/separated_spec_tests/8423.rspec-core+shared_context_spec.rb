RSpec.describe RSpec::SharedContext do
  it "is accessible as RSpec::Core::SharedContext" 


  it "is accessible as RSpec::SharedContext" 


  it "supports before and after hooks" 


  include RSpec::Core::SharedExampleGroup::TopLevelDSL

  it "runs the before each hooks in configuration before those of the shared context" 


  it "supports let" 


  it "supports let when applied to an individual example via metadata" 


  it 'supports explicit subjects' 


  %w[describe context].each do |method_name|
    it "supports nested example groups using #{method_name}" 

  end
end

