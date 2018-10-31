require 'spec_helper'

describe ResolvesPipelines do
  include GraphqlHelpers

  subject(:resolver) do
    Class.new(Resolvers::BaseResolver) do
      include ResolvesPipelines

      def resolve(**args)
        resolve_pipelines(object, args)
      end
    end
  end

  let(:current_user) { create(:user) }
  set(:project) { create(:project, :private) }
  set(:pipeline) { create(:ci_pipeline, project: project) }
  set(:failed_pipeline) { create(:ci_pipeline, :failed, project: project) }
  set(:ref_pipeline) { create(:ci_pipeline, project: project, ref: 'awesome-feature') }
  set(:sha_pipeline) { create(:ci_pipeline, project: project, sha: 'deadbeef') }

  before do
    project.add_developer(current_user)
  end

  it { is_expected.to have_graphql_arguments(:status, :ref, :sha) }

  it 'finds all pipelines' 


  it 'allows filtering by status' 


  it 'allows filtering by ref' 


  it 'allows filtering by sha' 


  it 'does not return any pipelines if the user does not have access' 


  def resolve_pipelines(args = {}, context = { current_user: current_user })
    resolve(resolver, obj: project, args: args, ctx: context)
  end
end

