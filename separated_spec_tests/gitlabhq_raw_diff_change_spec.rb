require 'spec_helper'

describe Gitlab::Git::RawDiffChange do
  let(:raw_change) { }
  let(:change) { described_class.new(raw_change) }

  context 'bad input' do
    let(:raw_change) { 'foo' }

    it 'does not set most of the attrs' 

  end

  context 'adding a file' do
    let(:raw_change) { '93e123ac8a3e6a0b600953d7598af629dec7b735 59 A  bar/branch-test.txt' }

    it 'initialize the proper attrs' 

  end

  context 'renaming a file' do
    let(:raw_change) { "85bc2f9753afd5f4fc5d7c75f74f8d526f26b4f3 107 R060\tfiles/js/commit.js.coffee\tfiles/js/commit.coffee" }

    it 'initialize the proper attrs' 

  end

  context 'modifying a file' do
    let(:raw_change) { 'c60514b6d3d6bf4bec1030f70026e34dfbd69ad5 824 M  README.md' }

    it 'initialize the proper attrs' 

  end

  context 'deleting a file' do
    let(:raw_change) { '60d7a906c2fd9e4509aeb1187b98d0ea7ce827c9 15364 D  files/.DS_Store' }

    it 'initialize the proper attrs' 

  end
end

