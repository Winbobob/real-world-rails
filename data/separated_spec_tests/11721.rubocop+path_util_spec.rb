# frozen_string_literal: true

RSpec.describe RuboCop::PathUtil do
  describe '#relative_path' do
    it 'builds paths relative to PWD by default as a stop-gap' 


    it 'supports custom base paths' 


    if RuboCop::Platform.windows?
      it 'works for different drives' 

      it 'works for the same drive' 

    end
  end

  describe '#match_path?', :isolated_environment do
    include FileHelper

    before do
      create_empty_file('file')
      create_empty_file('dir/file')
      create_empty_file('dir/files')
      create_empty_file('dir/dir/file')
      create_empty_file('dir/sub/file')
      create_empty_file('dir/.hidden/file')
      create_empty_file('dir/.hidden_file')
    end

    it 'does not match dir/** for file in hidden dir' 


    it 'matches dir/** for hidden file' 


    it 'does not match file in a subdirectory' 


    it 'matches strings to the full path' 


    it 'matches glob expressions' 


    it 'matches regexps' 


    it 'does not match invalid UTF-8 paths' 

  end
end

