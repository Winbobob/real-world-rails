require 'spec_helper'

describe Banzai::Filter::RelativeLinkFilter do
  def filter(doc, contexts = {})
    contexts.reverse_merge!({
      commit:         commit,
      project:        project,
      group:          group,
      project_wiki:   project_wiki,
      ref:            ref,
      requested_path: requested_path,
      only_path:      only_path
    })

    described_class.call(doc, contexts)
  end

  def image(path)
    %(<img src="#{path}" />)
  end

  def video(path)
    %(<video src="#{path}"></video>)
  end

  def link(path)
    %(<a href="#{path}">#{path}</a>)
  end

  def nested(element)
    %(<div>#{element}</div>)
  end

  let(:project)        { create(:project, :repository) }
  let(:group)          { nil }
  let(:project_path)   { project.full_path }
  let(:ref)            { 'markdown' }
  let(:commit)         { project.commit(ref) }
  let(:project_wiki)   { nil }
  let(:requested_path) { '/' }
  let(:only_path)      { true }

  shared_examples :preserve_unchanged do
    it 'does not modify any relative URL in anchor' 


    it 'does not modify any relative URL in image' 


    it 'does not modify any relative URL in video' 

  end

  context 'with a project_wiki' do
    let(:project_wiki) { double('ProjectWiki') }
    include_examples :preserve_unchanged
  end

  context 'without a repository' do
    let(:project) { create(:project) }
    include_examples :preserve_unchanged
  end

  context 'with an empty repository' do
    let(:project) { create(:project_empty_repo) }
    include_examples :preserve_unchanged
  end

  it 'does not raise an exception on invalid URIs' 


  it 'does not raise an exception with a garbled path' 


  it 'ignores ref if commit is passed' 


  shared_examples :valid_repository do
    it 'rebuilds absolute URL for a file in the repo' 


    it 'ignores absolute URLs with two leading slashes' 


    it 'rebuilds relative URL for a file in the repo' 


    it 'rebuilds relative URL for a file in the repo with leading ./' 


    it 'rebuilds relative URL for a file in the repo up one directory' 


    it 'rebuilds relative URL for a file in the repo up multiple directories' 


    it 'rebuilds relative URL for a file in the repository root' 


    it 'rebuilds relative URL for a file in the repo with an anchor' 


    it 'rebuilds relative URL for a directory in the repo' 


    it 'rebuilds relative URL for an image in the repo' 


    it 'rebuilds relative URL for link to an image in the repo' 


    it 'rebuilds relative URL for a video in the repo' 


    it 'does not modify relative URL with an anchor only' 


    it 'does not modify absolute URL' 


    it 'supports Unicode filenames' 


    context 'when requested path is a file in the repo' do
      let(:requested_path) { 'doc/api/README.md' }
      it 'rebuilds URL relative to the containing directory' 

    end

    context 'when requested path is a directory in the repo' do
      let(:requested_path) { 'doc/api/' }
      it 'rebuilds URL relative to the directory' 

    end

    context 'when ref name contains percent sign' do
      let(:ref) { '100%branch' }
      let(:commit) { project.commit('1b12f15a11fc6e62177bef08f47bc7b5ce50b141') }
      let(:requested_path) { 'foo/bar/' }
      it 'correctly escapes the ref' 

    end

    context 'when ref name contains special chars' do
      let(:ref) {'mark#\'@],+;-._/#@!$&()+down'}

      it 'correctly escapes the ref' 

    end

    context 'when requested path is a directory with space in the repo' do
      let(:ref) { 'master' }
      let(:commit) { project.commit('38008cb17ce1466d8fec2dfa6f6ab8dcfe5cf49e') }
      let(:requested_path) { 'with space/' }
      it 'does not escape the space twice' 

    end
  end

  context 'with a valid commit' do
    include_examples :valid_repository
  end

  context 'with a valid ref' do
    let(:commit) { nil } # force filter to use ref instead of commit
    include_examples :valid_repository
  end

  context 'with a /upload/ URL' do
    # not needed
    let(:commit) { nil }
    let(:ref) { nil }
    let(:requested_path) { nil }
    let(:upload_path) { '/uploads/e90decf88d8f96fe9e1389afc2e4a91f/test.jpg' }
    let(:relative_path) { "/#{project.full_path}#{upload_path}" }

    context 'to a project upload' do
      context 'with an absolute URL' do
        let(:absolute_path) { Gitlab.config.gitlab.url + relative_path }
        let(:only_path) { false }

        it 'rewrites the link correctly' 

      end

      it 'rebuilds relative URL for a link' 


      it 'rebuilds relative URL for an image' 


      it 'does not modify absolute URL' 


      it 'supports unescaped Unicode filenames' 


      it 'supports escaped Unicode filenames' 

    end

    context 'to a group upload' do
      let(:upload_link) { link('/uploads/e90decf88d8f96fe9e1389afc2e4a91f/test.jpg') }
      let(:group) { create(:group) }
      let(:project) { nil }
      let(:relative_path) { "/groups/#{group.full_path}/-/uploads/e90decf88d8f96fe9e1389afc2e4a91f/test.jpg" }

      context 'with an absolute URL' do
        let(:absolute_path) { Gitlab.config.gitlab.url + relative_path }
        let(:only_path) { false }

        it 'rewrites the link correctly' 

      end

      it 'rewrites the link correctly' 


      it 'rewrites the link correctly for subgroup' 


      it 'does not modify absolute URL' 

    end
  end
end

