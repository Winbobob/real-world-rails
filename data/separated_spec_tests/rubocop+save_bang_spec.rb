# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::SaveBang, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'checks_common_offense' do |method|
    it "when using #{method} with arguments" 


    it "when using #{method} with variable arguments" 


    it "when using #{method} with variable star arguments" 


    it "when using #{method} with variable star star arguments" 


    it "when using #{method} without arguments" 


    it "when using #{method}!" 


    it "when using #{method} with 2 arguments" 


    it "when using #{method} with wrong argument" 


    it 'autocorrects' 

  end

  shared_examples 'checks_variable_return_use_offense' do |method, update|
    it "when assigning the return value of #{method}" 


    it "when assigning the return value of #{method} with block" 


    it "when using #{method} with if" 


    it "when using #{method} with if with method chain" 


    it "when using #{method} with if with block" 


    it "when using #{method} with referenced block" 


    it "when using #{method} with negated if" 


    it "when using #{method} with multiple conditional" 


    it "when using #{method} with oneline if" 


    it "when using #{method} with oneline if and multiple conditional" 


    it "when using #{method} with a bunch of hashes & arrays" 


    it "when using #{method} with case statement" 


    it "when using #{method} with '&&'" 


    it "when using #{method} with 'and'" 


    it "when using #{method} with '||'" 


    it 'when passing to a method' 


    it 'when passing to a method as the non-last argument' 


    it "when using #{method} with 'or'" 


    it 'when passing to a method as a keyword argument' 


    it 'when assigning as a hash value' 


    it 'when using an explicit early return' 


    it 'when using an explicit final return' 


    it 'when using an explicit early return from a block' 


    it 'when using an explicit final return from a block' 


    it 'when using an allowed variable receiver' 


    it 'when using an allowed method receiver' 


    it 'when using an allowed const receiver' 


    it 'when using an allowed namespaced const receiver' 


    it 'when using only part of an allowed namespaced const receiver' 


    it 'when using a namespaced const with an allowed absolute const' 


    it 'when using an allowed method chain receiver' 


    it 'when using only part of an allowed method chain receiver' 


    it 'when using an allowed class and method receiver' 


    it 'when using only part of an allowed class and method receiver' 


    # Bug: https://github.com/rubocop-hq/rubocop/issues/4264
    it 'when using the assigned variable as value in a hash' 

  end

  shared_examples 'check_implicit_return' do |method, allow_implicit_return|
    it "when using #{method} as last method call" 


    it "when using #{method} as last method call of a block" 


    it "when using #{method} as part of the last line" 

  end

  described_class::MODIFY_PERSIST_METHODS.each do |method|
    let(:cop_config) { { 'AllowImplicitReturn' => true } }

    context method.to_s do
      it_behaves_like('checks_common_offense', method)
      it_behaves_like('checks_variable_return_use_offense', method, true)
      it_behaves_like('check_implicit_return', method, true)

      context 'with AllowImplicitReturn false' do
        let(:cop_config) { { 'AllowImplicitReturn' => false } }

        it_behaves_like('checks_variable_return_use_offense', method, true)
        it_behaves_like('check_implicit_return', method, false)
      end
    end
  end

  shared_examples 'checks_create_offense' do |method|
    it "when using persisted? after #{method}" 


    it "when using persisted? after #{method} with block" 


    it "when using persisted? after #{method} called on a chain" 

  end

  described_class::CREATE_PERSIST_METHODS.each do |method|
    let(:cop_config) { { 'AllowImplicitReturn' => true } }

    context method.to_s do
      it_behaves_like('checks_common_offense', method)
      it_behaves_like('checks_variable_return_use_offense', method, false)
      it_behaves_like('checks_create_offense', method)
      it_behaves_like('check_implicit_return', method, true)

      context 'with AllowImplicitReturn false' do
        let(:cop_config) { { 'AllowImplicitReturn' => false } }

        it_behaves_like('checks_variable_return_use_offense', method, false)
        it_behaves_like('check_implicit_return', method, false)
      end
    end
  end

  it 'properly ignores lvasign without right hand side' 

end

