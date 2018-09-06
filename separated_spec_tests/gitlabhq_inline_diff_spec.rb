require 'spec_helper'

describe Gitlab::Diff::InlineDiff do
  describe '.for_lines' do
    let(:diff) do
      <<-EOF.strip_heredoc
         class Test
        -  def initialize(test = true)
        +  def initialize(test = false)
             @test = test
        -    if true
        -      @foo = "bar"
        +    unless false
        +      @foo = "baz"
             end
           end
         end
      EOF
    end

    let(:subject) { described_class.for_lines(diff.lines) }

    it 'finds all inline diffs' 


    it 'can handle unchanged empty lines' 

  end

  describe "#inline_diffs" do
    let(:old_line) { "XXX def initialize(test = true)" }
    let(:new_line) { "YYY def initialize(test = false)" }
    let(:subject) { described_class.new(old_line, new_line, offset: 3).inline_diffs }

    it "finds the inline diff" 

  end
end

