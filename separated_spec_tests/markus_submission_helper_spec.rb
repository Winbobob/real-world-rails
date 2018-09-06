require 'spec_helper'

describe SubmissionsHelper do
  include SubmissionsHelper

  # Put some confidence in our submission filename sanitization
  context 'A new file when submitted' do
    context "containing characters outside what's allowed in a filename" do
      before :each do
        @filenames_to_be_sanitized = [ { expected: 'llll_', orig: 'llllé' },
                                       { expected: '________', orig: 'öä*?`ßÜÄ' },
                                       { expected: '', orig: nil },
                                       { expected: 'garbage-__.txt', orig: 'garbage-éæ.txt' },
                                       { expected: 'space_space.txt', orig: 'space space.txt' },
                                       { expected: '______.txt', orig: '      .txt' },
                                       { expected: 'garbage-__.txt', orig: 'garbage-éæ.txt' } ]
      end

      it 'have sanitized them properly' 

    end

    context 'containing only valid characters in a filename' do
      before :each do
        @filenames_not_to_be_sanitized = %w(valid_file.sh
                                            valid_001.file.ext
                                            valid-master.png
                                            some__file___.org-png
                                            001.txt)
      end

      it 'NOT have sanitized away any of their characters' 

    end
  end
end

