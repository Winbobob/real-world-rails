# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StderrPuts do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it "registers an offense when using `$stderr.puts('hello')`" 


  it "autocorrects `warn('hello')`" 

end

