require 'spec_helper'

describe Gitlab::Git::Conflict::Parser do
  describe '.parse' do
    def parse_text(text)
      described_class.parse(text, our_path: 'README.md', their_path: 'README.md')
    end

    context 'when the file has valid conflicts' do
      let(:text) do
        <<CONFLICT
module Gitlab
  module Regexp
    extend self

    def username_regexp
      default_regexp
    end

<<<<<<< files/ruby/regex.rb
    def project_name_regexp
      /\A[a-zA-Z0-9][a-zA-Z0-9_\-\. ]*\z/
    end

    def name_regexp
      /\A[a-zA-Z0-9_\-\. ]*\z/
=======
    def project_name_regex
      %r{\A[a-zA-Z0-9][a-zA-Z0-9_\-\. ]*\z}
    end

    def name_regex
      %r{\A[a-zA-Z0-9_\-\. ]*\z}
>>>>>>> files/ruby/regex.rb
    end

    def path_regexp
      default_regexp
    end

<<<<<<< files/ruby/regex.rb
    def archive_formats_regexp
      /(zip|tar|7z|tar\.gz|tgz|gz|tar\.bz2|tbz|tbz2|tb2|bz2)/
=======
    def archive_formats_regex
      %r{(zip|tar|7z|tar\.gz|tgz|gz|tar\.bz2|tbz|tbz2|tb2|bz2)}
>>>>>>> files/ruby/regex.rb
    end

    def git_reference_regexp
      # Valid git ref regexp, see:
      # https://www.kernel.org/pub/software/scm/git/docs/git-check-ref-format.html
      %r{
        (?!
           (?# doesn't begins with)
           \/|                    (?# rule #6)
           (?# doesn't contain)
           .*(?:
              [\/.]\.|            (?# rule #1,3)
              \/\/|               (?# rule #6)
              @\{|                (?# rule #8)
              \\                  (?# rule #9)
           )
        )
        [^\000-\040\177~^:?*\[]+  (?# rule #4-5)
        (?# doesn't end with)
        (?<!\.lock)               (?# rule #1)
        (?<![\/.])                (?# rule #6-7)
      }x
    end

    protected

<<<<<<< files/ruby/regex.rb
    def default_regexp
      /\A[.?]?[a-zA-Z0-9][a-zA-Z0-9_\-\.]*(?<!\.git)\z/
=======
    def default_regex
      %r{\A[.?]?[a-zA-Z0-9][a-zA-Z0-9_\-\.]*(?<!\.git)\z}
>>>>>>> files/ruby/regex.rb
    end
  end
end
CONFLICT
      end

      let(:lines) do
        described_class.parse(text, our_path: 'files/ruby/regex.rb', their_path: 'files/ruby/regex.rb')
      end
      let(:old_line_numbers) do
        lines.select { |line| line[:type] != 'new' }.map { |line| line[:line_old] }
      end
      let(:new_line_numbers) do
        lines.select { |line| line[:type] != 'old' }.map { |line| line[:line_new] }
      end
      let(:line_indexes) { lines.map { |line| line[:line_obj_index] } }

      it 'sets our lines as new lines' 


      it 'sets their lines as old lines' 


      it 'sets non-conflicted lines as both' 


      it 'sets consecutive line numbers for line_obj_index, line_old, and line_new' 

    end

    context 'when the file contents include conflict delimiters' do
      context 'when there is a non-start delimiter first' do
        it 'raises UnexpectedDelimiter when there is a middle delimiter first' 


        it 'raises UnexpectedDelimiter when there is an end delimiter first' 


        it 'does not raise when there is an end delimiter for a different path first' 

      end

      context 'when a start delimiter is followed by a non-middle delimiter' do
        let(:start_text) { "<<<<<<< README.md\n" }
        let(:end_text) { "\n=======\n>>>>>>> README.md" }

        it 'raises UnexpectedDelimiter when it is followed by an end delimiter' 


        it 'raises UnexpectedDelimiter when it is followed by another start delimiter' 


        it 'does not raise when it is followed by a start delimiter for a different path' 

      end

      context 'when a middle delimiter is followed by a non-end delimiter' do
        let(:start_text) { "<<<<<<< README.md\n=======\n" }
        let(:end_text) { "\n>>>>>>> README.md" }

        it 'raises UnexpectedDelimiter when it is followed by another middle delimiter' 


        it 'raises UnexpectedDelimiter when it is followed by a start delimiter' 


        it 'does not raise when it is followed by a start delimiter for another path' 

      end

      it 'raises MissingEndDelimiter when there is no end delimiter at the end' 

    end

    context 'other file types' do
      it 'raises UnmergeableFile when lines is blank, indicating a binary file' 


      it 'raises UnmergeableFile when the file is over 200 KB' 


      # All text from Rugged has an encoding of ASCII_8BIT, so force that in
      # these strings.
      context 'when the file contains UTF-8 characters' do
        it 'does not raise' 

      end
    end
  end
end

