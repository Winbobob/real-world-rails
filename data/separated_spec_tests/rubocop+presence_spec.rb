# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Presence do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'offense' do |source, correction, first_line, end_line|
    it 'registers an offense' 


    it 'auto correct' 

  end

  it_behaves_like 'offense', 'a.present? ? a : nil', 'a.presence', 1, 1
  it_behaves_like 'offense', '!a.present? ? nil: a', 'a.presence', 1, 1
  it_behaves_like 'offense', 'a.blank? ? nil : a', 'a.presence', 1, 1
  it_behaves_like 'offense', '!a.blank? ? a : nil', 'a.presence', 1, 1
  it_behaves_like 'offense', 'a.present? ? a : b', 'a.presence || b', 1, 1
  it_behaves_like 'offense', '!a.present? ? b : a', 'a.presence || b', 1, 1
  it_behaves_like 'offense', 'a.blank? ? b : a', 'a.presence || b', 1, 1
  it_behaves_like 'offense', '!a.blank? ? a : b', 'a.presence || b', 1, 1

  it_behaves_like 'offense',
                  'a(:bar).map(&:baz).present? ? a(:bar).map(&:baz) : nil',
                  'a(:bar).map(&:baz).presence',
                  1, 1

  it_behaves_like 'offense', <<-RUBY.strip_indent.chomp, 'a.presence', 1, 5
    if a.present?
      a
    else
      nil
    end
  RUBY

  it_behaves_like 'offense', <<-RUBY.strip_indent.chomp, 'a.presence', 1, 5
    unless a.present?
      nil
    else
      a
    end
  RUBY

  it_behaves_like 'offense', 'a if a.present?', 'a.presence', 1, 1
  it_behaves_like 'offense', 'a unless a.blank?', 'a.presence', 1, 1
  it_behaves_like 'offense', <<-RUBY.strip_indent.chomp, <<-FIXED.strip_indent.chomp, 1, 7 # rubocop:disable Metrics/LineLength
    if [1, 2, 3].map { |num| num + 1 }
                .map { |num| num + 2 }
                .present?
      [1, 2, 3].map { |num| num + 1 }.map { |num| num + 2 }
    else
      b
    end
  RUBY
    [1, 2, 3].map { |num| num + 1 }
                .map { |num| num + 2 }.presence || b
  FIXED

  it 'does not register an offense when using `#presence`' 


  it 'does not register an offense when the expression does not ' \
     'return the receiver of `#present?`' do
    expect_no_offenses(<<-RUBY.strip_indent)
      a.present? ? b : nil
    RUBY

    expect_no_offenses(<<-RUBY.strip_indent)
      puts foo if present?
      puts foo if !present?
    RUBY
  end

  it 'does not register an offense when the expression does not ' \
     'return the receiver of `#blank?`' do
    expect_no_offenses(<<-RUBY.strip_indent)
      a.blank? ? nil : b
    RUBY

    expect_no_offenses(<<-RUBY.strip_indent)
      puts foo if blank?
      puts foo if !blank?
    RUBY
  end

  it 'does not register an offense when if or unless modifier is used ' 


  it 'does not register an offense when the else block is multiline' 


  it 'does not register an offense when the else block has multiple ' \
     'statements' do
    expect_no_offenses(<<-RUBY.strip_indent)
      if a.present?
        a
      else
        something; something; something
      end
    RUBY
  end

  it 'does not register an offense when including the elsif block' 


  it 'does not register an offense when the else block has `if` node' 


  it 'does not register an offense when the else block has `rescue` node' 


  it 'does not register an offense when the else block has `while` node' 


  it 'does not register an offense when using #present? with elsif block' 

end

