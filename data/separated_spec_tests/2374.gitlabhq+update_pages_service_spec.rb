require "spec_helper"

describe Projects::UpdatePagesService do
  set(:project) { create(:project, :repository) }
  set(:pipeline) { create(:ci_pipeline, project: project, sha: project.commit('HEAD').sha) }
  set(:build) { create(:ci_build, pipeline: pipeline, ref: 'HEAD') }
  let(:invalid_file) { fixture_file_upload('spec/fixtures/dk.png') }
  let(:extension) { 'zip' }

  let(:file) { fixture_file_upload("spec/fixtures/pages.#{extension}") }
  let(:empty_file) { fixture_file_upload("spec/fixtures/pages_empty.#{extension}") }
  let(:metadata) do
    filename = "spec/fixtures/pages.#{extension}.meta"
    fixture_file_upload(filename) if File.exist?(filename)
  end

  subject { described_class.new(project, build) }

  before do
    project.remove_pages
  end

  context 'legacy artifacts' do
    let(:extension) { 'zip' }

    before do
      build.update(legacy_artifacts_file: file)
      build.update(legacy_artifacts_metadata: metadata)
    end

    describe 'pages artifacts' do
      it "doesn't delete artifacts after deploying" 

    end

    it 'succeeds' 


    it 'limits pages size' 


    it 'removes pages after destroy' 


    it 'fails if sha on branch is not latest' 


    it 'fails for empty file fails' 

  end

  context 'for new artifacts' do
    context "for a valid job" do
      before do
        create(:ci_job_artifact, file: file, job: build)
        create(:ci_job_artifact, file_type: :metadata, file_format: :gzip, file: metadata, job: build)

        build.reload
      end

      describe 'pages artifacts' do
        it "doesn't delete artifacts after deploying" 

      end

      it 'succeeds' 


      it 'limits pages size' 


      it 'removes pages after destroy' 


      it 'fails if sha on branch is not latest' 


      context 'when using empty file' do
        let(:file) { empty_file }

        it 'fails to extract' 

      end

      context 'when timeout happens by DNS error' do
        before do
          allow_any_instance_of(described_class)
            .to receive(:extract_zip_archive!).and_raise(SocketError)
        end

        it 'raises an error' 

      end

      context 'when failed to extract zip artifacts' do
        before do
          expect_any_instance_of(described_class)
            .to receive(:extract_zip_archive!)
            .and_raise(Projects::UpdatePagesService::FailedToExtractError)
        end

        it 'raises an error' 

      end

      context 'when missing artifacts metadata' do
        before do
          expect(build).to receive(:artifacts_metadata?).and_return(false)
        end

        it 'does not raise an error as failed job' 

      end
    end
  end

  it 'fails to remove project pages when no pages is deployed' 


  it 'fails if no artifacts' 


  it 'fails for invalid archive' 


  describe 'maximum pages artifacts size' do
    let(:metadata) { spy('metadata') }

    before do
      file = fixture_file_upload('spec/fixtures/pages.zip')
      metafile = fixture_file_upload('spec/fixtures/pages.zip.meta')

      build.update(legacy_artifacts_file: file)
      build.update(legacy_artifacts_metadata: metafile)

      allow(build).to receive(:artifacts_metadata_entry)
        .and_return(metadata)
    end

    shared_examples 'pages size limit exceeded' do
      it 'limits the maximum size of gitlab pages' 

    end

    context 'when maximum pages size is set to zero' do
      before do
        stub_application_setting(max_pages_size: 0)
      end

      context 'when page size does not exceed internal maximum' do
        before do
          allow(metadata).to receive(:total_size).and_return(200.megabytes)
        end

        it 'updates pages correctly' 

      end

      context 'when pages size does exceed internal maximum' do
        before do
          allow(metadata).to receive(:total_size).and_return(2.terabytes)
        end

        it_behaves_like 'pages size limit exceeded'
      end
    end

    context 'when pages size is greater than max size setting' do
      before do
        stub_application_setting(max_pages_size: 200)
        allow(metadata).to receive(:total_size).and_return(201.megabytes)
      end

      it_behaves_like 'pages size limit exceeded'
    end

    context 'when max size setting is greater than internal max size' do
      before do
        stub_application_setting(max_pages_size: 3.terabytes / 1.megabyte)
        allow(metadata).to receive(:total_size).and_return(2.terabytes)
      end

      it_behaves_like 'pages size limit exceeded'
    end
  end

  def deploy_status
    GenericCommitStatus.find_by(name: 'pages:deploy')
  end

  def execute
    subject.execute[:status]
  end
end

