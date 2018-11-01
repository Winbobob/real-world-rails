require 'spec_helper'

describe Gitlab::BackgroundMigration::RedactLinks, :migration, schema: 20181014121030 do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:issues) { table(:issues) }
  let(:notes) { table(:notes) }
  let(:snippets) { table(:snippets) }
  let(:users) { table(:users) }
  let(:merge_requests) { table(:merge_requests) }
  let(:namespace) { namespaces.create(name: 'gitlab', path: 'gitlab-org') }
  let(:project) { projects.create(namespace_id: namespace.id, name: 'foo') }
  let(:user) { users.create!(email: 'test@example.com', projects_limit: 100, username: 'test') }

  def create_merge_request(id, params)
    params.merge!(id: id,
                  target_project_id: project.id,
                  target_branch: 'master',
                  source_project_id: project.id,
                  source_branch: 'mr name',
                  title: "mr name#{id}")

    merge_requests.create(params)
  end

  def create_issue(id, params)
    params.merge!(id: id, title: "issue#{id}", project_id: project.id)

    issues.create(params)
  end

  def create_note(id, params)
    params[:id] = id

    notes.create(params)
  end

  def create_snippet(id, params)
    params.merge!(id: id, author_id: user.id)

    snippets.create(params)
  end

  def create_resource(model, id, params)
    send("create_#{model.name.underscore}", id, params)
  end

  shared_examples_for 'redactable resource' do
    it 'updates only matching texts' 

  end

  context 'resource is Issue' do
    it_behaves_like 'redactable resource' do
      let(:model) { Issue }
      let(:field) { :description }
    end
  end

  context 'resource is Merge Request' do
    it_behaves_like 'redactable resource' do
      let(:model) { MergeRequest }
      let(:field) { :description }
    end
  end

  context 'resource is Note' do
    it_behaves_like 'redactable resource' do
      let(:model) { Note }
      let(:field) { :note }
    end
  end

  context 'resource is Snippet' do
    it_behaves_like 'redactable resource' do
      let(:model) { Snippet }
      let(:field) { :description }
    end
  end
end

