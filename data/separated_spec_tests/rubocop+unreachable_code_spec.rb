# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnreachableCode do
  subject(:cop) { described_class.new }

  def wrap(str)
    head = <<-RUBY.strip_indent
      def something
        array.each do |item|
    RUBY
    tail = <<-RUBY.strip_indent
        end
      end
    RUBY
    body = str.strip_indent.each_line.map { |line| "    #{line}" }.join
    head + body + tail
  end

  %w[return next break retry redo throw raise fail exit exit! abort].each do |t|
    it "registers an offense for `#{t}` before other statements" 


    it "registers an offense for `#{t}` in `begin`" 


    it "registers an offense for `#{t}` in all `if` branches" 


    it "registers an offense for `#{t}` in all `if` branches" \
       'with other expressions' do
      expect_offense(wrap(<<-RUBY))
        if cond
          something
          #{t}
        else
          something2
          #{t}
        end
        bar
        ^^^ Unreachable code detected.
      RUBY
    end

    it "registers an offense for `#{t}` in all `if` and `elsif` branches" 


    it "registers an offense for `#{t}` in all `case` branches" 


    it "accepts code with conditional `#{t}`" 


    it "accepts `#{t}` as the final expression" 


    it "accepts `#{t}` is in all `if` branchsi" 


    it "accepts `#{t}` is in `if` branch only" 


    it "accepts `#{t}` is in `if`, and without `else`" 


    it "accepts `#{t}` is in `else` branch only" 


    it "accepts `#{t}` is not in `elsif` branch" 


    it "accepts `#{t}` is in `case` branch without else" 

  end
end

