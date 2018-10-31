describe FactoryBot::StrategyCalculator do
  let(:strategy) do
    define_class("MyAwesomeClass")
  end

  context "when a class" do
    subject { FactoryBot::StrategyCalculator.new(strategy).strategy }

    it "returns the class passed" 

  end

  context "when a symbol" do
    before do
      allow(FactoryBot).to receive(:strategy_by_name).and_return(strategy)
    end

    subject { FactoryBot::StrategyCalculator.new(:build).strategy }

    it "finds the strategy by name" 


    it "returns the strategy found" 

  end
end

