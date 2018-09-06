# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::SaveBang do
  subject(:cop) { described_class.new }

  shared_examples 'checks_common_offense' do |method|
    it "when using #{method} with arguments" 


    it "when using #{method} without arguments" 


    it "when using #{method}!" 


    it "when using #{method} with 2 arguments" 


    it "when using #{method} with wrong argument" 


    it 'autocorrects' 

  end

  shared_examples 'checks_variable_return_use_offense' do |method, pass|
    it "when assigning the return value of #{method}" 


    it "when assigning the return value of #{method} with block" 


    it "when using #{method} with if" 


    it "when using #{method} with negated if" 


    it "when using #{method} with multiple conditional" 


    it "when using #{method} with oneline if" 


    it "when using #{method} with oneline if and multiple conditional" 


    it "when using #{method} with case statement" 


    it "when using #{method} with '&&'" 


    it "when using #{method} with 'and'" 


    it "when using #{method} with '||'" 


    it "when using #{method} with 'or'" 


    it "when using #{method} as last method call" 


    # Bug: https://github.com/bbatsov/rubocop/issues/4264
    it 'when using the assigned variable as value in a hash' 

  end

  described_class::MODIFY_PERSIST_METHODS.each do |method|
    it_behaves_like('checks_common_offense', method)
    it_behaves_like('checks_variable_return_use_offense', method, true)
  end

  shared_examples 'checks_create_offense' do |method|
    it "when using persisted? after #{method}" 


    it "when using persisted? after #{method} with block" 

  end

  described_class::CREATE_PERSIST_METHODS.each do |method|
    it_behaves_like('checks_common_offense', method)
    it_behaves_like('checks_variable_return_use_offense', method, false)
    it_behaves_like('checks_create_offense', method)
  end

  it 'properly ignores lvasign without right hand side' 

end

