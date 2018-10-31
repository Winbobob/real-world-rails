require 'spec_helper'

describe 'project routing' do
  before do
    allow(Project).to receive(:find_by_full_path).and_return(false)
    allow(Project).to receive(:find_by_full_path).with('gitlab/gitlabhq', any_args).and_return(true)
  end

  # Shared examples for a resource inside a Project
  #
  # By default it tests all the default REST actions: index, create, new, edit,
  # show, update, and destroy. You can remove actions by customizing the
  # `actions` variable.
  #
  # It also expects a `controller` variable to be available which defines both
  # the path to the resource as well as the controller name.
  #
  # Examples
  #
  #   # Default behavior
  #   it_behaves_like 'RESTful project resources' do
  #     let(:controller) { 'issues' }
  #   end
  #
  #   # Customizing actions
  #   it_behaves_like 'RESTful project resources' do
  #     let(:actions)    { [:index] }
  #     let(:controller) { 'issues' }
  #   end
  #
  #   # Different controller name and path
  #   it_behaves_like 'RESTful project resources' do
  #     let(:controller) { 'pages_domains' }
  #     let(:controller_path) { 'pages/domains' }
  #   end
  shared_examples 'RESTful project resources' do
    let(:actions) { [:index, :create, :new, :edit, :show, :update, :destroy] }
    let(:controller_path) { controller }

    it 'to #index' 


    it 'to #create' 


    it 'to #new' 


    it 'to #edit' 


    it 'to #show' 


    it 'to #update' 


    it 'to #destroy' 

  end

  #                 projects POST   /projects(.:format)     projects#create
  #              new_project GET    /projects/new(.:format) projects#new
  #            files_project GET    /:id/files(.:format)    projects#files
  #             edit_project GET    /:id/edit(.:format)     projects#edit
  #                  project GET    /:id(.:format)          projects#show
  #                          PUT    /:id(.:format)          projects#update
  #                          DELETE /:id(.:format)          projects#destroy
  # preview_markdown_project POST   /:id/preview_markdown(.:format) projects#preview_markdown
  describe ProjectsController, 'routing' do
    it 'to #create' 


    it 'to #new' 


    it 'to #edit' 


    describe 'to #show' do
      context 'regular name' do
        it { expect(get('/gitlab/gitlabhq')).to route_to('projects#show', namespace_id: 'gitlab', id: 'gitlabhq') }
      end

      context 'name with dot' do
        before do
          allow(Project).to receive(:find_by_full_path).with('gitlab/gitlabhq.keys', any_args).and_return(true)
        end

        it { expect(get('/gitlab/gitlabhq.keys')).to route_to('projects#show', namespace_id: 'gitlab', id: 'gitlabhq.keys') }
      end

      context 'with nested group' do
        before do
          allow(Project).to receive(:find_by_full_path).with('gitlab/subgroup/gitlabhq', any_args).and_return(true)
        end

        it { expect(get('/gitlab/subgroup/gitlabhq')).to route_to('projects#show', namespace_id: 'gitlab/subgroup', id: 'gitlabhq') }
      end
    end

    it 'to #update' 


    it 'to #destroy' 


    it 'to #preview_markdown' 

  end

  # members_namespace_project_autocomplete_sources_path        GET /:project_id/autocomplete_sources/members(.:format)        projects/autocomplete_sources#members
  # issues_namespace_project_autocomplete_sources_path         GET /:project_id/autocomplete_sources/issues(.:format)         projects/autocomplete_sources#issues
  # merge_requests_namespace_project_autocomplete_sources_path GET /:project_id/autocomplete_sources/merge_requests(.:format) projects/autocomplete_sources#merge_requests
  # labels_namespace_project_autocomplete_sources_path         GET /:project_id/autocomplete_sources/labels(.:format)         projects/autocomplete_sources#labels
  # milestones_namespace_project_autocomplete_sources_path     GET /:project_id/autocomplete_sources/milestones(.:format)     projects/autocomplete_sources#milestones
  # commands_namespace_project_autocomplete_sources_path       GET /:project_id/autocomplete_sources/commands(.:format)       projects/autocomplete_sources#commands
  describe Projects::AutocompleteSourcesController, 'routing' do
    [:members, :issues, :merge_requests, :labels, :milestones, :commands].each do |action|
      it "to ##{action}" 

    end
  end

  #  pages_project_wikis GET    /:project_id/wikis/pages(.:format)       projects/wikis#pages
  # history_project_wiki GET    /:project_id/wikis/:id/history(.:format) projects/wikis#history
  #        project_wikis POST   /:project_id/wikis(.:format)             projects/wikis#create
  #    edit_project_wiki GET    /:project_id/wikis/:id/edit(.:format)    projects/wikis#edit
  #         project_wiki GET    /:project_id/wikis/:id(.:format)         projects/wikis#show
  #                      DELETE /:project_id/wikis/:id(.:format)         projects/wikis#destroy
  describe Projects::WikisController, 'routing' do
    it 'to #pages' 


    it 'to #history' 


    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:create, :edit, :show, :destroy] }
      let(:controller) { 'wikis' }
    end
  end

  # branches_project_repository GET    /:project_id/repository/branches(.:format) projects/repositories#branches
  #     tags_project_repository GET    /:project_id/repository/tags(.:format)     projects/repositories#tags
  #  archive_project_repository GET    /:project_id/repository/archive(.:format)  projects/repositories#archive
  #     edit_project_repository GET    /:project_id/repository/edit(.:format)     projects/repositories#edit
  describe Projects::RepositoriesController, 'routing' do
    it 'to #archive format:zip' 


    it 'to #archive format:tar.bz2' 


    it 'to #archive with "/" in route' 


    it 'to #archive_alternative' 


    it 'to #archive_deprecated' 


    it 'to #archive_deprecated format:zip' 


    it 'to #archive_deprecated format:tar.bz2' 


    it 'to #archive_deprecated with "/" in route' 

  end

  describe Projects::BranchesController, 'routing' do
    it 'to #branches' 

  end

  describe Projects::TagsController, 'routing' do
    it 'to #tags' 

  end

  #     project_deploy_keys GET    /:project_id/deploy_keys(.:format)          deploy_keys#index
  #                         POST   /:project_id/deploy_keys(.:format)          deploy_keys#create
  #  new_project_deploy_key GET    /:project_id/deploy_keys/new(.:format)      deploy_keys#new
  #      project_deploy_key GET    /:project_id/deploy_keys/:id(.:format)      deploy_keys#show
  # edit_project_deploy_key GET    /:project_id/deploy_keys/:id/edit(.:format) deploy_keys#edit
  #      project_deploy_key PATCH  /:project_id/deploy_keys/:id(.:format)      deploy_keys#update
  #                         DELETE /:project_id/deploy_keys/:id(.:format)      deploy_keys#destroy
  describe Projects::DeployKeysController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:index, :new, :create, :edit, :update] }
      let(:controller) { 'deploy_keys' }
    end
  end

  # project_protected_branches GET    /:project_id/protected_branches(.:format)     protected_branches#index
  #                            POST   /:project_id/protected_branches(.:format)     protected_branches#create
  #   project_protected_branch DELETE /:project_id/protected_branches/:id(.:format) protected_branches#destroy
  describe Projects::ProtectedBranchesController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:index, :create, :destroy] }
      let(:controller) { 'protected_branches' }
    end
  end

  #    switch_project_refs GET    /:project_id/refs/switch(.:format)              refs#switch
  #  logs_tree_project_ref GET    /:project_id/refs/:id/logs_tree(.:format)       refs#logs_tree
  #  logs_file_project_ref GET    /:project_id/refs/:id/logs_tree/:path(.:format) refs#logs_tree
  describe Projects::RefsController, 'routing' do
    it 'to #switch' 


    it 'to #logs_tree' 

  end

  describe Projects::MergeRequestsController, 'routing' do
    it 'to #commits' 


    it 'to #pipelines' 


    it 'to #merge' 


    it 'to #show' 


    it_behaves_like 'RESTful project resources' do
      let(:controller) { 'merge_requests' }
      let(:actions) { [:index, :edit, :show, :update] }
    end
  end

  describe Projects::MergeRequests::CreationsController, 'routing' do
    it 'to #new' 


    it 'to #create' 


    it 'to #branch_from' 


    it 'to #branch_to' 


    it 'to #pipelines' 


    it 'to #diffs' 

  end

  describe Projects::MergeRequests::DiffsController, 'routing' do
    it 'to #show' 

  end

  describe Projects::MergeRequests::ConflictsController, 'routing' do
    it 'to #show' 

  end
  #  raw_project_snippet GET    /:project_id/snippets/:id/raw(.:format)  snippets#raw
  #     project_snippets GET    /:project_id/snippets(.:format)          snippets#index
  #                      POST   /:project_id/snippets(.:format)          snippets#create
  #  new_project_snippet GET    /:project_id/snippets/new(.:format)      snippets#new
  # edit_project_snippet GET    /:project_id/snippets/:id/edit(.:format) snippets#edit
  #      project_snippet GET    /:project_id/snippets/:id(.:format)      snippets#show
  #                      PUT    /:project_id/snippets/:id(.:format)      snippets#update
  #                      DELETE /:project_id/snippets/:id(.:format)      snippets#destroy
  describe SnippetsController, 'routing' do
    it 'to #raw' 


    it 'to #index' 


    it 'to #create' 


    it 'to #new' 


    it 'to #edit' 


    it 'to #show' 


    it 'to #update' 


    it 'to #destroy' 

  end

  # test_project_hook GET    /:project_id/hooks/:id/test(.:format) hooks#test
  #     project_hooks GET    /:project_id/hooks(.:format)          hooks#index
  #                   POST   /:project_id/hooks(.:format)          hooks#create
  # edit_project_hook GET    /:project_id/hooks/:id/edit(.:format) hooks#edit
  #      project_hook PUT    /:project_id/hooks/:id(.:format)      hooks#update
  #                   DELETE /:project_id/hooks/:id(.:format)      hooks#destroy
  describe Projects::HooksController, 'routing' do
    it 'to #test' 


    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:index, :create, :destroy, :edit, :update] }
      let(:controller) { 'hooks' }
    end
  end

  # retry_namespace_project_hook_hook_log GET /:project_id/hooks/:hook_id/hook_logs/:id/retry(.:format) projects/hook_logs#retry
  # namespace_project_hook_hook_log       GET /:project_id/hooks/:hook_id/hook_logs/:id(.:format)       projects/hook_logs#show
  describe Projects::HookLogsController, 'routing' do
    it 'to #retry' 


    it 'to #show' 

  end

  # project_commit GET    /:project_id/commit/:id(.:format) commit#show {id: /\h{7,40}/, project_id: /[^\/]+/}
  describe Projects::CommitController, 'routing' do
    it 'to #show' 

  end

  #    patch_project_commit GET    /:project_id/commits/:id/patch(.:format) commits#patch
  #         project_commits GET    /:project_id/commits(.:format)           commits#index
  #                         POST   /:project_id/commits(.:format)           commits#create
  #          project_commit GET    /:project_id/commits/:id(.:format)       commits#show
  describe Projects::CommitsController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:show] }
      let(:controller) { 'commits' }
    end

    it 'to #show' 

  end

  #     project_project_members GET    /:project_id/project_members(.:format)          project_members#index
  #                          POST   /:project_id/project_members(.:format)          project_members#create
  #                          PUT    /:project_id/project_members/:id(.:format)      project_members#update
  #                          DELETE /:project_id/project_members/:id(.:format)      project_members#destroy
  describe Projects::ProjectMembersController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:index, :create, :update, :destroy] }
      let(:controller) { 'project_members' }
    end
  end

  #     project_milestones    GET    /:project_id/milestones(.:format)          milestones#index
  #                           POST   /:project_id/milestones(.:format)          milestones#create
  #  new_project_milestone    GET    /:project_id/milestones/new(.:format)      milestones#new
  # edit_project_milestone    GET    /:project_id/milestones/:id/edit(.:format) milestones#edit
  #      project_milestone    GET    /:project_id/milestones/:id(.:format)      milestones#show
  #                           PUT    /:project_id/milestones/:id(.:format)      milestones#update
  #                           DELETE /:project_id/milestones/:id(.:format)      milestones#destroy
  # promote_project_milestone POST /:project_id/milestones/:id/promote          milestones#promote
  describe Projects::MilestonesController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:controller) { 'milestones' }
      let(:actions) { [:index, :create, :new, :edit, :show, :update] }
    end

    it 'to #promote' 

  end

  # project_labels GET    /:project_id/labels(.:format) labels#index
  describe Projects::LabelsController, 'routing' do
    it 'to #index' 

  end

  #        sort_project_issues POST   /:project_id/issues/sort(.:format)        issues#sort
  # bulk_update_project_issues POST   /:project_id/issues/bulk_update(.:format) issues#bulk_update
  #      search_project_issues GET    /:project_id/issues/search(.:format)      issues#search
  #             project_issues GET    /:project_id/issues(.:format)             issues#index
  #                            POST   /:project_id/issues(.:format)             issues#create
  #          new_project_issue GET    /:project_id/issues/new(.:format)         issues#new
  #         edit_project_issue GET    /:project_id/issues/:id/edit(.:format)    issues#edit
  #              project_issue GET    /:project_id/issues/:id(.:format)         issues#show
  #                            PUT    /:project_id/issues/:id(.:format)         issues#update
  #                            DELETE /:project_id/issues/:id(.:format)         issues#destroy
  describe Projects::IssuesController, 'routing' do
    it 'to #bulk_update' 


    it_behaves_like 'RESTful project resources' do
      let(:controller) { 'issues' }
      let(:actions) { [:index, :create, :new, :edit, :show, :update] }
    end
  end

  # project_noteable_notes GET    /:project_id/noteable/:target_type/:target_id/notes notes#index
  #                        POST   /:project_id/notes(.:format)                        notes#create
  #           project_note DELETE /:project_id/notes/:id(.:format)                    notes#destroy
  describe Projects::NotesController, 'routing' do
    it 'to #index' 


    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:create, :destroy] }
      let(:controller) { 'notes' }
    end
  end

  # project_blame GET    /:project_id/blame/:id(.:format) blame#show {id: /.+/, project_id: /[^\/]+/}
  describe Projects::BlameController, 'routing' do
    it 'to #show' 

  end

  # project_blob GET    /:project_id/blob/:id(.:format) blob#show {id: /.+/, project_id: /[^\/]+/}
  describe Projects::BlobController, 'routing' do
    it 'to #show' 

  end

  # project_tree GET    /:project_id/tree/:id(.:format) tree#show {id: /.+/, project_id: /[^\/]+/}
  describe Projects::TreeController, 'routing' do
    it 'to #show' 

  end

  # project_find_file GET /:namespace_id/:project_id/find_file/*id(.:format)  projects/find_file#show {:id=>/.+/, :namespace_id=>/[a-zA-Z.0-9_\-]+/, :project_id=>/[a-zA-Z.0-9_\-]+(?<!\.atom)/, :format=>/html/}
  # project_files     GET /:namespace_id/:project_id/files/*id(.:format)      projects/find_file#list {:id=>/(?:[^.]|\.(?!json$))+/, :namespace_id=>/[a-zA-Z.0-9_\-]+/, :project_id=>/[a-zA-Z.0-9_\-]+(?<!\.atom)/, :format=>/json/}
  describe Projects::FindFileController, 'routing' do
    it 'to #show' 


    it 'to #list' 

  end

  describe Projects::BlobController, 'routing' do
    it 'to #edit' 


    it 'to #preview' 

  end

  # project_compare_index GET    /:project_id/compare(.:format)             compare#index {id: /[^\/]+/, project_id: /[^\/]+/}
  #                       POST   /:project_id/compare(.:format)             compare#create {id: /[^\/]+/, project_id: /[^\/]+/}
  #       project_compare        /:project_id/compare/:from...:to(.:format) compare#show {from: /.+/, to: /.+/, id: /[^\/]+/, project_id: /[^\/]+/}
  describe Projects::CompareController, 'routing' do
    it 'to #index' 


    it 'to #compare' 


    it 'to #show' 

  end

  describe Projects::NetworkController, 'routing' do
    it 'to #show' 

  end

  describe Projects::GraphsController, 'routing' do
    it 'to #show' 

  end

  describe Projects::ForksController, 'routing' do
    it 'to #new' 


    it 'to #create' 

  end

  # project_avatar DELETE /project/avatar(.:format) projects/avatars#destroy
  describe Projects::AvatarsController, 'routing' do
    it 'to #destroy' 

  end

  describe Projects::PagesDomainsController, 'routing' do
    it_behaves_like 'RESTful project resources' do
      let(:actions)    { [:show, :new, :create, :destroy] }
      let(:controller) { 'pages_domains' }
      let(:controller_path) { 'pages/domains' }
    end

    it 'to #destroy with a valid domain name' 


    it 'to #show with a valid domain' 

  end

  describe Projects::Registry::TagsController, 'routing' do
    describe '#destroy' do
      it 'correctly routes to a destroy action' 


      it 'takes registry tag name constrains into account' 

    end
  end
end

