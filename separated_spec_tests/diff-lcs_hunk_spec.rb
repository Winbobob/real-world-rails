# -*- ruby encoding: utf-8 -*-

require 'spec_helper'

if String.method_defined?(:encoding)
  require 'diff/lcs/hunk'

  describe Diff::LCS::Hunk do
    let(:old_data) { ["Tu avec carté {count} itém has".encode('UTF-16LE')] }
    let(:new_data) { ["Tu avec carte {count} item has".encode('UTF-16LE')] }
    let(:pieces)   { Diff::LCS.diff old_data, new_data }
    let(:hunk)     { Diff::LCS::Hunk.new(old_data, new_data, pieces[0], 3, 0) }

    it 'produces a unified diff from the two pieces' 


    it 'produces a context diff from the two pieces' 


    it 'produces an old diff from the two pieces' 


    it 'produces a reverse ed diff from the two pieces' 


    context 'with empty first data set' do
      let(:old_data) { [] }

      it 'produces a unified diff' 

    end
  end
end

