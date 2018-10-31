RSpec.describe Object, "#should" do
  before(:example) do
    @target = "target"
    @matcher = double("matcher")
    allow(@matcher).to receive(:matches?).and_return(true)
    allow(@matcher).to receive(:failure_message)
  end

  it "accepts and interacts with a matcher" 


  it "asks for a failure_message when matches? returns false" 


  context "on interpretters that have BasicObject", :if => defined?(BasicObject) do
    let(:proxy_class) do
      Class.new(BasicObject) do
        def initialize(target)
          @target = target
        end

        def proxied?
          true
        end

        def respond_to?(method, *args)
          method.to_sym == :proxied? || @target.respond_to?(symbol, *args)
        end

        def method_missing(name, *args)
          @target.send(name, *args)
        end
      end
    end

    it 'works properly on BasicObject-subclassed proxy objects' 


    it 'does not break the deprecation check on BasicObject-subclassed proxy objects' 

  end
end

RSpec.describe Object, "#should_not" do
  before(:example) do
    @target = "target"
    @matcher = double("matcher")
  end

  it "accepts and interacts with a matcher" 


  it "asks for a failure_message_when_negated when matches? returns true" 

end

