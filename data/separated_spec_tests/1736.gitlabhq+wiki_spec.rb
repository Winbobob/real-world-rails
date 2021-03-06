require 'spec_helper'

describe Gitlab::Git::Wiki do
  using RSpec::Parameterized::TableSyntax

  let(:project) { create(:project) }
  let(:user) { project.owner }
  let(:project_wiki) { ProjectWiki.new(project, user) }

  subject(:wiki) { project_wiki.wiki }

  describe '#pages' do
    before do
      create_page('page1', 'content')
      create_page('page2', 'content2')
    end

    after do
      destroy_page('page1')
      destroy_page('page2')
    end

    it 'returns all the pages' 


    it 'returns only one page' 

  end

  describe '#page' do
    before do
      create_page('page1', 'content')
      create_page('foo/page1', 'content foo/page1')
    end

    after do
      destroy_page('page1')
      destroy_page('page1', 'foo')
    end

    it 'returns the right page' 

  end

  describe '#delete_page' do
    after do
      destroy_page('page1')
    end

    it 'only removes the page with the same path' 

  end

  describe '#preview_slug' do
    where(:title, :format, :expected_slug) do
      'The Best Thing'       | :markdown  | 'The-Best-Thing'
      'The Best Thing'       | :md        | 'The-Best-Thing'
      'The Best Thing'       | :txt       | 'The-Best-Thing'
      'A Subject/Title Here' | :txt       | 'A-Subject/Title-Here'
      'A subject'            | :txt       | 'A-subject'
      'A 1/B 2/C 3'          | :txt       | 'A-1/B-2/C-3'
      'subject/title'        | :txt       | 'subject/title'
      'subject/title.md'     | :txt       | 'subject/title.md'
      'foo<bar>+baz'         | :txt       | 'foo-bar--baz'
      'foo%2Fbar'            | :txt       | 'foo%2Fbar'
      ''                     | :markdown  | '.md'
      ''                     | :md        | '.md'
      ''                     | :txt       | '.txt'
    end

    with_them do
      subject { wiki.preview_slug(title, format) }

      let(:gitaly_slug) { wiki.pages.first }

      it { is_expected.to eq(expected_slug) }

      it 'matches the slug generated by gitaly' 

    end
  end

  def create_page(name, content, format: :markdown)
    wiki.write_page(name, format, content, commit_details(name))
  end

  def commit_details(name)
    Gitlab::Git::Wiki::CommitDetails.new(user.id, user.username, user.name, user.email, "created page #{name}")
  end

  def destroy_page(title, dir = '')
    page = wiki.page(title: title, dir: dir)
    project_wiki.delete_page(page, "test commit")
  end
end

