# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantConditional do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  before { inspect_source(source) }

  shared_examples 'code with offense' do |code, expected, message_expression|
    context "when checking #{code.inspect}" do
      let(:source) { code }

      it 'registers an offense' 


      it 'auto-corrects' 


      it 'claims to auto-correct' 

    end
  end

  shared_examples 'code without offense' do |code|
    let(:source) { code }

    context "when checking #{code.inspect}" do
      it 'does not register an offense' 

    end
  end

  it_behaves_like 'code with offense',
                  'x == y ? true : false',
                  'x == y'

  it_behaves_like 'code with offense',
                  'x == y ? false : true',
                  '!(x == y)'

  it_behaves_like 'code without offense',
                  'x == y ? 1 : 10'

  it_behaves_like 'code with offense',
                  <<-RUBY.strip_indent,
                    if x == y
                      true
                    else
                      false
                    end
                  RUBY
                  "x == y\n",
                  'x == y'

  it_behaves_like 'code with offense',
                  <<-RUBY.strip_indent,
                    if x == y
                      false
                    else
                      true
                    end
                  RUBY
                  "!(x == y)\n",
                  '!(x == y)'

  it_behaves_like 'code with offense',
                  <<-RUBY.strip_indent,
                    if cond
                      false
                    elsif x == y
                      true
                    else
                      false
                    end
                  RUBY
                  <<-RUBY.strip_indent,
                    if cond
                      false
                    else
                      x == y
                    end
                  RUBY
                  "\nelse\n  x == y"

  it_behaves_like 'code with offense',
                  <<-RUBY.strip_indent,
                    if cond
                      false
                    elsif x == y
                      false
                    else
                      true
                    end
                  RUBY
                  <<-RUBY.strip_indent,
                    if cond
                      false
                    else
                      !(x == y)
                    end
                  RUBY
                  "\nelse\n  !(x == y)"

  it_behaves_like 'code without offense',
                  <<-RUBY.strip_indent
                    if x == y
                      1
                    else
                      2
                    end
                  RUBY

  it_behaves_like 'code without offense',
                  <<-RUBY.strip_indent
                    if cond
                      1
                    elseif x == y
                      2
                    else
                      3
                    end
                  RUBY
end

