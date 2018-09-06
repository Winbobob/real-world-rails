require 'spec_helper'
require 'erb'

# This feature spec is intended to be a comprehensive exercising of all of
# GitLab's non-standard Markdown parsing and the integration thereof.
#
# These tests should be very high-level. Anything low-level belongs in the specs
# for the corresponding HTML::Pipeline filter or helper method.
#
# The idea is to pass a Markdown document through our entire processing stack.
#
# The process looks like this:
#
#   Raw Markdown
#   -> `markdown` helper
#     -> Redcarpet::Render::GitlabHTML converts Markdown to HTML
#       -> Post-process HTML
#         -> `gfm` helper
#           -> HTML::Pipeline
#             -> SanitizationFilter
#             -> Other filters, depending on pipeline
#           -> `html_safe`
#           -> Template
#
# See the MarkdownFeature class for setup details.

describe 'GitLab Markdown' do
  include Capybara::Node::Matchers
  include MarkupHelper
  include MarkdownMatchers

  # Sometimes it can be useful to see the parsed output of the Markdown document
  # for debugging. Call this method to write the output to
  # `tmp/capybara/<filename>.html`.
  def write_markdown(filename = 'markdown_spec')
    File.open(Rails.root.join("tmp/capybara/#{filename}.html"), 'w') do |file|
      file.puts @html
    end
  end

  def doc(html = @html)
    @doc ||= Nokogiri::HTML::DocumentFragment.parse(html)
  end

  # Shared behavior that all pipelines should exhibit
  shared_examples 'all pipelines' do
    describe 'Redcarpet extensions' do
      it 'does not parse emphasis inside of words' 


      it 'parses table Markdown' 


      it 'allows Markdown in tables' 


      it 'parses fenced code blocks' 


      it 'parses mermaid code block' 


      it 'parses strikethroughs' 


      it 'parses superscript' 

    end

    describe 'SanitizationFilter' do
      it 'permits b elements' 


      it 'permits em elements' 


      it 'permits code elements' 


      it 'permits kbd elements' 


      it 'permits strike elements' 


      it 'permits img elements' 


      it 'permits br elements' 


      it 'permits hr elements' 


      it 'permits span elements' 


      it 'permits details elements' 


      it 'permits summary elements' 


      it 'permits style attribute in th elements' 


      it 'permits style attribute in td elements' 


      it 'removes `rel` attribute from links' 


      it "removes `href` from `a` elements if it's fishy" 

    end

    describe 'Escaping' do
      it 'escapes non-tag angle brackets' 

    end

    describe 'Edge Cases' do
      it 'allows markup inside link elements' 

    end

    describe 'ExternalLinkFilter' do
      it 'adds nofollow to external link' 


      it 'adds noreferrer to external link' 


      it 'adds _blank to target attribute for external links' 


      it 'ignores internal link' 

    end
  end

  before do
    @feat = MarkdownFeature.new

    # `markdown` helper expects a `@project` and `@group` variable
    @project = @feat.project
    @group = @feat.group
  end

  context 'default pipeline' do
    before do
      @html = markdown(@feat.raw_markdown)
    end

    it_behaves_like 'all pipelines'

    it 'includes RelativeLinkFilter' 


    it 'includes EmojiFilter' 


    it 'includes TableOfContentsFilter' 


    it 'includes AutolinkFilter' 


    it 'includes all reference filters' 


    it 'includes TaskListFilter' 


    it 'includes InlineDiffFilter' 


    it 'includes VideoLinkFilter' 


    it 'includes ColorFilter' 

  end

  context 'wiki pipeline' do
    before do
      @project_wiki = @feat.project_wiki
      @project_wiki_page = @feat.project_wiki_page

      file = Gollum::File.new(@project_wiki.wiki)
      expect(file).to receive(:path).and_return('images/example.jpg')
      expect(@project_wiki).to receive(:find_file).with('images/example.jpg').and_return(file)
      allow(@project_wiki).to receive(:wiki_base_path) { '/namespace1/gitlabhq/wikis' }

      @html = markdown(@feat.raw_markdown, { pipeline: :wiki, project_wiki: @project_wiki, page_slug: @project_wiki_page.slug })
    end

    it_behaves_like 'all pipelines'

    it 'includes RelativeLinkFilter' 


    it 'includes EmojiFilter' 


    it 'includes TableOfContentsFilter' 


    it 'includes AutolinkFilter' 


    it 'includes all reference filters' 


    it 'includes TaskListFilter' 


    it 'includes GollumTagsFilter' 


    it 'includes InlineDiffFilter' 


    it 'includes VideoLinkFilter' 


    it 'includes ColorFilter' 

  end

  # Fake a `current_user` helper
  def current_user
    @feat.user
  end
end

