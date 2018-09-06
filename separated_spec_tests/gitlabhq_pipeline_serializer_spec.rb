require 'spec_helper'

describe PipelineSerializer do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }

  let(:serializer) do
    described_class.new(current_user: user)
  end

  subject { serializer.represent(resource) }

  describe '#represent' do
    context 'when used without pagination' do
      it 'created a not paginated serializer' 


      context 'when a single object is being serialized' do
        let(:resource) { create(:ci_empty_pipeline, project: project) }

        it 'serializers the pipeline object' 

      end

      context 'when multiple objects are being serialized' do
        let(:resource) { create_list(:ci_pipeline, 2, project: project) }

        it 'serializers the array of pipelines' 

      end
    end

    context 'when used with pagination' do
      let(:request) { spy('request') }
      let(:response) { spy('response') }
      let(:pagination) { {} }

      before do
        allow(request)
          .to receive(:query_parameters)
          .and_return(pagination)
      end

      let(:serializer) do
        described_class.new(current_user: user)
          .with_pagination(request, response)
      end

      it 'created a paginated serializer' 


      context 'when resource is not paginatable' do
        context 'when a single pipeline object is being serialized' do
          let(:resource) { create(:ci_empty_pipeline) }
          let(:pagination) { { page: 1, per_page: 1 } }

          it 'raises error' 

        end
      end

      context 'when resource is paginatable relation' do
        let(:resource) { Ci::Pipeline.all }
        let(:pagination) { { page: 1, per_page: 2 } }

        context 'when a single pipeline object is present in relation' do
          before do
            create(:ci_empty_pipeline)
          end

          it 'serializes pipeline relation' 

        end

        context 'when a multiple pipeline objects are being serialized' do
          before do
            create_list(:ci_empty_pipeline, 3)
          end

          it 'serializes appropriate number of objects' 


          it 'appends relevant headers' 

        end
      end
    end

    context 'number of queries' do
      let(:resource) { Ci::Pipeline.all }

      before do
        # Since RequestStore.active? is true we have to allow the
        # gitaly calls in this block
        # Issue: https://gitlab.com/gitlab-org/gitlab-ce/issues/37772
        Gitlab::GitalyClient.allow_n_plus_1_calls do
          Ci::Pipeline::AVAILABLE_STATUSES.each do |status|
            create_pipeline(status)
          end
        end
        Gitlab::GitalyClient.reset_counts
      end

      shared_examples 'no N+1 queries' do
        it 'verifies number of queries', :request_store do
          recorded = ActiveRecord::QueryRecorder.new { subject }

          expect(recorded.count).to be_within(1).of(44)
          expect(recorded.cached_count).to eq(0)
        end
      end

      context 'with the same ref' do
        let(:ref) { 'feature' }

        it_behaves_like 'no N+1 queries'
      end

      context 'with different refs' do
        def ref
          @sequence ||= 0
          @sequence += 1
          "feature-#{@sequence}"
        end

        it_behaves_like 'no N+1 queries'
      end

      def create_pipeline(status)
        create(:ci_empty_pipeline,
               project: project,
               status: status,
               ref: ref).tap do |pipeline|
          Ci::Build::AVAILABLE_STATUSES.each do |status|
            create_build(pipeline, status, status)
          end
        end
      end

      def create_build(pipeline, stage, status)
        create(:ci_build, :tags, :triggered, :artifacts,
          pipeline: pipeline, stage: stage,
          name: stage, status: status, ref: pipeline.ref)
      end
    end
  end

  describe '#represent_status' do
    context 'when represents only status' do
      let(:resource) { create(:ci_pipeline) }
      let(:status) { resource.detailed_status(double('user')) }

      subject { serializer.represent_status(resource) }

      it 'serializes only status' 

    end
  end
end
