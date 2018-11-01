RSpec.describe RuboCop::Cop::RSpec::SharedContext do
  subject(:cop) { described_class.new }

  describe 'shared_context' do
    it 'does not register an offense for empty contexts' 


    it 'registers an offense for shared_context with only examples' 
          it 'performs actions' 

        end
      RUBY
    end

    it 'does not register an offense for `shared_context` with let' 
          it 'performs actions' 

        end
      RUBY
    end

    it 'does not register an offense for `shared_context` with subject' 
          it 'performs actions' 

        end
      RUBY
    end

    it 'does not register an offense for `shared_context` with before' 
          it 'performs actions' 

        end
      RUBY
    end
  end

  describe 'shared_examples' do
    it 'does not register an offense for empty examples' 


    it 'registers an offense for shared_examples with only let' 


    it 'registers an offense for shared_examples with only subject' 


    it 'registers an offense for shared_examples with only hooks' 


    it 'does not register an offense for `shared_examples` with it' 
          it 'works' 

        end
      RUBY
    end
  end

  bad_shared_context = <<-RUBY
    shared_context 'foo' do
      it 'performs actions' 

    end
  RUBY

  good_shared_context = <<-RUBY
    shared_examples 'foo' do
      it 'performs actions' 

    end
  RUBY

  include_examples 'autocorrect',
                   bad_shared_context,
                   good_shared_context

  bad_shared_examples = <<-RUBY
    shared_examples 'foo' do
      let(:foo) { :bar }
    end
  RUBY

  good_shared_examples = <<-RUBY
    shared_context 'foo' do
      let(:foo) { :bar }
    end
  RUBY

  include_examples 'autocorrect',
                   bad_shared_examples,
                   good_shared_examples
end

