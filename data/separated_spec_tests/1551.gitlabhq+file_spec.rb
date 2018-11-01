require 'spec_helper'

describe Gitlab::Conflict::File do
  include GitHelpers

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:rugged) { rugged_repo(repository) }
  let(:their_commit) { rugged.branches['conflict-start'].target }
  let(:our_commit) { rugged.branches['conflict-resolvable'].target }
  let(:merge_request) { create(:merge_request, source_branch: 'conflict-resolvable', target_branch: 'conflict-start', source_project: project) }
  let(:index) { rugged.merge_commits(our_commit, their_commit) }
  let(:rugged_conflict) { index.conflicts.last }
  let(:raw_conflict_content) { index.merge_file('files/ruby/regex.rb')[:data] }
  let(:raw_conflict_file) { Gitlab::Git::Conflict::File.new(repository, our_commit.oid, rugged_conflict, raw_conflict_content) }
  let(:conflict_file) { described_class.new(raw_conflict_file, merge_request: merge_request) }

  describe '#resolve_lines' do
    let(:section_keys) { conflict_file.sections.map { |section| section[:id] }.compact }

    context 'when resolving everything to the same side' do
      let(:resolution_hash) { section_keys.map { |key| [key, 'head'] }.to_h }
      let(:resolved_lines) { conflict_file.resolve_lines(resolution_hash) }
      let(:expected_lines) { conflict_file.lines.reject { |line| line.type == 'old' } }

      it 'has the correct number of lines' 


      it 'has content matching the chosen lines' 

    end

    context 'with mixed resolutions' do
      let(:resolution_hash) do
        section_keys.map.with_index { |key, i| [key, i.even? ? 'head' : 'origin'] }.to_h
      end

      let(:resolved_lines) { conflict_file.resolve_lines(resolution_hash) }

      it 'has the correct number of lines' 


      it 'returns a file containing only the chosen parts of the resolved sections' 

    end

    it 'raises ResolutionError when passed a hash without resolutions for all sections' 

  end

  describe '#highlight_lines!' do
    def html_to_text(html)
      CGI.unescapeHTML(ActionView::Base.full_sanitizer.sanitize(html)).delete("\n")
    end

    it 'is called implicitly when rich_text is accessed on a line' 


    it 'sets the rich_text of the lines matching the text content' 


    # This spec will break if Rouge's highlighting changes, but we need to
    # ensure that the lines are actually highlighted.
    it 'highlights the lines correctly' 

  end

  describe '#sections' do
    it 'only inserts match lines when there is a gap between sections' 


    it 'sets conflict to false for sections with only unchanged lines' 


    it 'only includes a maximum of CONTEXT_LINES (plus an optional match line) in context sections' 


    it 'sets conflict to true for sections with only changed lines' 


    it 'adds unique IDs to conflict sections, and not to other sections' 


    context 'with an example file' do
      let(:raw_conflict_content) do
        <<FILE
  # Ensure there is no match line header here
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

# Some extra lines
# To force a match line
# To be created

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
FILE
      end

      let(:sections) { conflict_file.sections }

      it 'sets the correct match line headers' 


      it 'does not add match lines where they are not needed' 


      it 'creates context sections of the correct length' 

    end
  end

  describe '#as_json' do
    it 'includes the blob path for the file' 


    it 'includes the blob icon for the file' 


    context 'with the full_content option passed' do
      it 'includes the full content of the conflict' 

    end
  end
end

