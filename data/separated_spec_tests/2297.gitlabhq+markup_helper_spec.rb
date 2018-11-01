require 'spec_helper'

describe MarkupHelper do
  let!(:project) { create(:project, :repository) }

  let(:user)          { create(:user, username: 'gfm') }
  let(:commit)        { project.commit }
  let(:issue)         { create(:issue, project: project) }
  let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let(:snippet)       { create(:project_snippet, project: project) }

  before do
    # Ensure the generated reference links aren't redacted
    project.add_maintainer(user)

    # Helper expects a @project instance variable
    helper.instance_variable_set(:@project, project)

    # Stub the `current_user` helper
    allow(helper).to receive(:current_user).and_return(user)
  end

  describe "#markdown" do
    describe "referencing multiple objects" do
      let(:actual) { "#{merge_request.to_reference} -> #{commit.to_reference} -> #{issue.to_reference}" }

      it "links to the merge request" 


      it "links to the commit" 


      it "links to the issue" 

    end

    describe "override default project" do
      let(:actual) { issue.to_reference }
      let(:second_project) { create(:project, :public) }
      let(:second_issue) { create(:issue, project: second_project) }

      it 'links to the issue' 

    end
  end

  describe '#markdown_field' do
    let(:attribute) { :title }

    describe 'with already redacted attribute' do
      it 'returns the redacted attribute' 

    end

    describe 'without redacted attribute' do
      it 'renders the markdown value' 

    end
  end

  describe '#link_to_markdown_field' do
    let(:link)    { '/commits/0a1b2c3d' }
    let(:issues)  { create_list(:issue, 2, project: project) }

    it 'handles references nested in links with all the text' 

  end

  describe '#link_to_markdown' do
    let(:link)    { '/commits/0a1b2c3d' }
    let(:issues)  { create_list(:issue, 2, project: project) }

    it 'handles references nested in links with all the text' 


    it 'forwards HTML options' 


    it "escapes HTML passed in as the body" 


    it 'ignores reference links when they are the entire body' 


    it 'replaces commit message with emoji to link' 

  end

  describe '#link_to_html' do
    it 'wraps the rendered content in a link' 

  end

  describe '#render_wiki_content' do
    before do
      @wiki = double('WikiPage')
      allow(@wiki).to receive(:content).and_return('wiki content')
      allow(@wiki).to receive(:slug).and_return('nested/page')
      helper.instance_variable_set(:@project_wiki, @wiki)
    end

    it "uses Wiki pipeline for markdown files" 


    it 'uses Wiki pipeline for markdown files with RedCarpet if feature disabled' 


    it "uses Asciidoctor for asciidoc files" 


    it "uses the Gollum renderer for all other file types" 

  end

  describe 'markup' do
    let(:content) { 'Noël' }

    it 'preserves encoding' 


    it 'delegates to #markdown_unsafe when file name corresponds to Markdown' 


    it 'delegates to #asciidoc_unsafe when file name corresponds to AsciiDoc' 


    it 'uses passed in rendered content' 


    it 'defaults to CommonMark' 


    it 'honors markdown_engine for RedCarpet' 


    it 'uses RedCarpet if feature disabled' 

  end

  describe '#first_line_in_markdown' do
    shared_examples_for 'common markdown examples' do
      let(:project_base) { build(:project, :repository) }

      it 'displays inline code' 


      it 'truncates the text with multiple paragraphs' 


      it 'displays the first line of a code block' 


      it 'truncates a single long line of text' 


      it 'preserves a link href when link text is truncated' 


      it 'preserves code color scheme' 


      context 'when images are allowed' do
        it 'preserves data-src for lazy images' 

      end

      context 'when images are not allowed' do
        it 'removes any images' 

      end

      context 'labels formatting' do
        let(:label_title) { 'this should be ~label_1' }

        def create_and_format_label(project)
          create(:label, title: 'label_1', project: project)
          object = create_object(label_title, project: project)

          first_line_in_markdown(object, attribute, 150, project: project)
        end

        it 'preserves style attribute for a label that can be accessed by current_user' 


        it 'does not style a label that can not be accessed by current_user' 

      end

      it 'truncates Markdown properly' 


      it 'truncates Markdown with emoji properly' 

    end

    context 'when the asked attribute can be redacted' do
      include_examples 'common markdown examples' do
        let(:attribute) { :note }
        def create_object(title, project: project_base)
          build(:note, note: title, project: project)
        end
      end
    end

    context 'when the asked attribute can not be redacted' do
      include_examples 'common markdown examples' do
        let(:attribute) { :body }
        def create_object(title, project: project_base)
          issue = build(:issue, title: title)
          build(:todo, :done, project: project_base, author: user, target: issue)
        end
      end
    end
  end

  describe '#cross_project_reference' do
    it 'shows the full MR reference' 


    it 'shows the full issue reference' 

  end

  def urls
    Gitlab::Routing.url_helpers
  end
end

