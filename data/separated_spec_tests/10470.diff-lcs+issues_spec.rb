# -*- ruby encoding: utf-8 -*-

require 'spec_helper'

describe "Diff::LCS Issues" do
  include Diff::LCS::SpecHelper::Matchers

  describe 'issue #1' do
    shared_examples 'handles simple diffs' do |s1, s2, forward_diff|
      before do
        @diff_s1_s2 = Diff::LCS.diff(s1, s2)
      end

      it 'creates the correct diff' 


      it 'creates the correct patch s1->s2' 


      it 'creates the correct patch s2->s1' 

    end

    describe 'string' do
      it_has_behavior 'handles simple diffs', 'aX', 'bXaX', [
        [ [ '+', 0, 'b' ],
          [ '+', 1, 'X' ] ],
      ]
      it_has_behavior 'handles simple diffs', 'bXaX', 'aX', [
        [ [ '-', 0, 'b' ],
          [ '-', 1, 'X' ] ],
      ]
    end

    describe 'array' do
      it_has_behavior 'handles simple diffs', %w(a X), %w(b X a X), [
        [ [ '+', 0, 'b' ],
          [ '+', 1, 'X' ] ],
      ]
      it_has_behavior 'handles simple diffs', %w(b X a X), %w(a X), [
        [ [ '-', 0, 'b' ],
          [ '-', 1, 'X' ] ],
      ]
    end
  end
end
