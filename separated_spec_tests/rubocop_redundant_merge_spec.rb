# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::RedundantMerge, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'MaxKeyValuePairs' => 2 }
  end

  it 'autocorrects hash.merge!(a: 1)' 


  it 'autocorrects hash.merge!("abc" => "value")' 


  context 'when receiver is a local variable' do
    it 'autocorrects hash.merge!(a: 1, b: 2)' 

  end

  context 'when receiver is a method call' do
    it "doesn't autocorrect hash.merge!(a: 1, b: 2)" 

  end

  context 'when receiver is implicit' do
    it "doesn't autocorrect" 

  end

  context 'when any argument is a double splat' do
    it 'does not register an offense' 

  end

  context 'when internal to each_with_object' do
    it 'autocorrects when the receiver is the object being built' 


    it 'autocorrects when the receiver is the object being built when ' \
       'merge! is the last statement' do
      source = <<-RUBY.strip_indent
        foo.each_with_object({}) do |f, hash|
          some_method
          hash.merge!(a: 1, b: 2)
        end
      RUBY
      new_source = autocorrect_source(source)

      expect(new_source).to eq(<<-RUBY.strip_indent)
        foo.each_with_object({}) do |f, hash|
          some_method
          hash[:a] = 1
          hash[:b] = 2
        end
      RUBY
    end

    it 'autocorrects when the receiver is the object being built when ' \
       'merge! is not the last statement' do
      source = <<-RUBY.strip_indent
        foo.each_with_object({}) do |f, hash|
          hash.merge!(a: 1, b: 2)
          why_are_you_doing_this?
        end
      RUBY
      new_source = autocorrect_source(source)

      expect(new_source).to eq(<<-RUBY.strip_indent)
        foo.each_with_object({}) do |f, hash|
          hash[:a] = 1
          hash[:b] = 2
          why_are_you_doing_this?
        end
      RUBY
    end

    it 'does not register an offense when merge! is being assigned inside ' \
       'each_with_object' do
      source = <<-RUBY.strip_indent
        foo.each_with_object({}) do |f, hash|
          changes = hash.merge!(a: 1, b: 2)
          why_are_you_doing_this?
        end
      RUBY
      inspect_source(source)

      expect(cop.offenses.empty?).to be(true)
    end

    it 'autocorrects when receiver uses element reference to the object ' \
       'built by each_with_object' do
      source = <<-RUBY.strip_indent
        foo.each_with_object(bar) do |f, hash|
          hash[:a].merge!(b: "")
        end
      RUBY
      new_source = autocorrect_source(source)

      expect(new_source).to eq(<<-RUBY.strip_indent)
        foo.each_with_object(bar) do |f, hash|
          hash[:a][:b] = ""
        end
      RUBY
    end

    it 'autocorrects when receiver uses multiple element references to the ' \
       'object built by each_with_object' do
      source = <<-RUBY.strip_indent
        foo.each_with_object(bar) do |f, hash|
          hash[:a][:b].merge!(c: "")
        end
      RUBY
      new_source = autocorrect_source(source)

      expect(new_source).to eq(<<-RUBY.strip_indent)
        foo.each_with_object(bar) do |f, hash|
          hash[:a][:b][:c] = ""
        end
      RUBY
    end

    it 'autocorrects merge! called on any method on the object built ' \
       'by each_with_object' do
      source = <<-RUBY.strip_indent
        foo.each_with_object(bar) do |f, hash|
          hash.bar.merge!(c: "")
        end
      RUBY
      new_source = autocorrect_source(source)

      expect(new_source).to eq(<<-RUBY.strip_indent)
        foo.each_with_object(bar) do |f, hash|
          hash.bar[:c] = ""
        end
      RUBY
    end
  end

  %w[if unless while until].each do |kw|
    context "when there is a modifier #{kw}, and more than 1 pair" do
      it "autocorrects it to an #{kw} block" 


      context 'when original code was indented' do
        it 'maintains proper indentation' 

      end
    end
  end

  context 'when code is indented, and there is more than 1 pair' do
    it 'indents the autocorrected code properly' 

  end

  it "doesn't register an error when return value is used" 


  it 'formats the error message correctly for hash.merge!(a: 1)' 


  context 'with MaxKeyValuePairs of 1' do
    let(:cop_config) do
      { 'MaxKeyValuePairs' => 1 }
    end

    it "doesn't register errors for multi-value hash merges" 

  end
end

