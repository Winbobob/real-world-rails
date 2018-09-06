require 'spec_helper'

describe BlobHelper do
  include TreeHelper

  let(:blob_name) { 'test.lisp' }
  let(:no_context_content) { ":type \"assem\"))" }
  let(:blob_content) { "(make-pathname :defaults name\n#{no_context_content}" }
  let(:split_content) { blob_content.split("\n") }
  let(:multiline_content) do
    %q(
    def test(input):
      """This is line 1 of a multi-line comment.
      This is line 2.
      """
    )
  end

  describe '#highlight' do
    it 'returns plaintext for unknown lexer context' 


    it 'returns plaintext for long blobs' 


    it 'highlights single block' 


    it 'highlights multi-line comments' 


    context 'diff highlighting' do
      let(:blob_name) { 'test.diff' }
      let(:blob_content) { "+aaa\n+bbb\n- ccc\n ddd\n"}
      let(:expected) do
        %q(<pre class="code highlight"><code><span id="LC1" class="line" lang="diff"><span class="gi">+aaa</span></span>
<span id="LC2" class="line" lang="diff"><span class="gi">+bbb</span></span>
<span id="LC3" class="line" lang="diff"><span class="gd">- ccc</span></span>
<span id="LC4" class="line" lang="diff"> ddd</span></code></pre>)
      end

      it 'highlights each line properly' 

    end
  end

  describe "#sanitize_svg_data" do
    let(:input_svg_path) { File.join(Rails.root, 'spec', 'fixtures', 'unsanitized.svg') }
    let(:data) { open(input_svg_path).read }
    let(:expected_svg_path) { File.join(Rails.root, 'spec', 'fixtures', 'sanitized.svg') }
    let(:expected) { open(expected_svg_path).read }

    it 'retains essential elements' 

  end

  describe "#edit_blob_link" do
    let(:namespace) { create(:namespace, name: 'gitlab' )}
    let(:project) { create(:project, :repository, namespace: namespace) }

    before do
      allow(self).to receive(:current_user).and_return(nil)
      allow(self).to receive(:can_collaborate_with_project?).and_return(true)
    end

    it 'verifies blob is text' 


    it 'uses the passed blob instead retrieve from repository' 


    it 'returns a link with the proper route' 


    it 'returns a link with the passed link_opts on the expected route' 

  end

  context 'viewer related' do
    include FakeBlobHelpers

    let(:project) { build(:project, lfs_enabled: true) }

    before do
      allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)
    end

    let(:viewer_class) do
      Class.new(BlobViewer::Base) do
        include BlobViewer::ServerSide

        self.collapse_limit = 1.megabyte
        self.size_limit = 5.megabytes
        self.type = :rich
      end
    end

    let(:viewer) { viewer_class.new(blob) }
    let(:blob) { fake_blob }

    describe '#blob_render_error_reason' do
      context 'for error :too_large' do
        context 'when the blob size is larger than the absolute size limit' do
          let(:blob) { fake_blob(size: 10.megabytes) }

          it 'returns an error message' 

        end

        context 'when the blob size is larger than the size limit' do
          let(:blob) { fake_blob(size: 2.megabytes) }

          it 'returns an error message' 

        end
      end

      context 'for error :server_side_but_stored_externally' do
        let(:blob) { fake_blob(lfs: true) }

        it 'returns an error message' 

      end
    end

    describe '#blob_render_error_options' do
      before do
        assign(:project, project)
        assign(:blob, blob)
        assign(:id, File.join('master', blob.path))

        controller.params[:controller] = 'projects/blob'
        controller.params[:action] = 'show'
        controller.params[:namespace_id] = project.namespace.to_param
        controller.params[:project_id] = project.to_param
        controller.params[:id] = File.join('master', blob.path)
      end

      context 'for error :collapsed' do
        let(:blob) { fake_blob(size: 2.megabytes) }

        it 'includes a "load it anyway" link' 

      end

      context 'for error :too_large' do
        let(:blob) { fake_blob(size: 10.megabytes) }

        it 'does not include a "load it anyway" link' 


        context 'when the viewer is rich' do
          context 'the blob is rendered as text' do
            let(:blob) { fake_blob(path: 'file.md', size: 2.megabytes) }

            it 'includes a "view the source" link' 

          end

          context 'the blob is not rendered as text' do
            let(:blob) { fake_blob(path: 'file.pdf', binary: true, size: 2.megabytes) }

            it 'does not include a "view the source" link' 

          end
        end

        context 'when the viewer is not rich' do
          before do
            viewer_class.type = :simple
          end

          let(:blob) { fake_blob(path: 'file.md', size: 2.megabytes) }

          it 'does not include a "view the source" link' 

        end

        it 'includes a "download it" link' 

      end

      context 'for error :server_side_but_stored_externally' do
        let(:blob) { fake_blob(path: 'file.md', lfs: true) }

        it 'does not include a "load it anyway" link' 


        it 'does not include a "view the source" link' 


        it 'includes a "download it" link' 

      end
    end
  end

  describe '#ide_edit_path' do
    let(:project) { create(:project) }

    around do |example|
      old_script_name = Rails.application.routes.default_url_options[:script_name]
      begin
        example.run
      ensure
        Rails.application.routes.default_url_options[:script_name] = old_script_name
      end
    end

    it 'returns full IDE path' 


    it 'returns IDE path without relative_url_root' 

  end
end

