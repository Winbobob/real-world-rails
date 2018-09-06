require 'support/aruba_support'

RSpec.describe 'Fail if no examples' do
  include_context "aruba support"
  before { clean_current_dir }

  context 'when 1 passing example' do
    def passing_example(fail_if_no_examples)
      "
        RSpec.configure { |c| c.fail_if_no_examples = #{fail_if_no_examples} }

        RSpec.describe 'something' do
          it 'succeeds' 

        end
      "
    end

    it 'succeeds if fail_if_no_examples set to true' 


    it 'succeeds if fail_if_no_examples set to false' 

  end

  context 'when 1 failing example' do
    def failing_example(fail_if_no_examples)
      "
        RSpec.configure { |c| c.fail_if_no_examples = #{fail_if_no_examples} }

        RSpec.describe 'something' do
          it 'fails' 

        end
      "
    end

    it 'fails if fail_if_no_examples set to true' 


    it 'fails if fail_if_no_examples set to false' 

  end

  context 'when 0 examples' do
    def no_examples(fail_if_no_examples)
      "
        RSpec.configure { |c| c.fail_if_no_examples = #{fail_if_no_examples} }

        RSpec.describe 'something' do
        end
      "
    end

    it 'fails if fail_if_no_examples set to true' 


    it 'succeeds if fail_if_no_examples set to false' 


    context 'when custom failure_exit_code set' do
      def no_examples_custom_failure_exit_code(fail_if_no_examples)
        "
          RSpec.configure do |c|
            c.fail_if_no_examples = #{fail_if_no_examples}
            c.failure_exit_code = 15
          end

          RSpec.describe 'something' do
          end
        "
      end

      it 'fails if fail_if_no_examples set to true' 

    end
  end
end

