require 'spec_helper'

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
shared_examples 'importer routing' do
  let(:except_actions) { [] }

  it 'to #create' 


  it 'to #new' 


  it 'to #status' 


  it 'to #callback' 


  it 'to #jobs' 

end

# personal_access_token_import_github POST     /import/github/personal_access_token(.:format)                                                import/github#personal_access_token
#                status_import_github GET      /import/github/status(.:format)                                                               import/github#status
#              callback_import_github GET      /import/github/callback(.:format)                                                             import/github#callback
#                  jobs_import_github GET      /import/github/jobs(.:format)                                                                 import/github#jobs
#                       import_github POST     /import/github(.:format)                                                                      import/github#create
#                   new_import_github GET      /import/github/new(.:format)                                                                  import/github#new
describe Import::GithubController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:provider) { 'github' }
  end

  it 'to #personal_access_token' 

end

# personal_access_token_import_gitea POST     /import/gitea/personal_access_token(.:format)                                                 import/gitea#personal_access_token
#                status_import_gitea GET      /import/gitea/status(.:format)                                                                import/gitea#status
#                  jobs_import_gitea GET      /import/gitea/jobs(.:format)                                                                  import/gitea#jobs
#                       import_gitea POST     /import/gitea(.:format)                                                                       import/gitea#create
#                   new_import_gitea GET      /import/gitea/new(.:format)                                                                   import/gitea#new
describe Import::GiteaController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:except_actions) { [:callback] }
    let(:provider) { 'gitea' }
  end

  it 'to #personal_access_token' 

end

#   status_import_gitlab GET      /import/gitlab/status(.:format)                                                               import/gitlab#status
# callback_import_gitlab GET      /import/gitlab/callback(.:format)                                                             import/gitlab#callback
#     jobs_import_gitlab GET      /import/gitlab/jobs(.:format)                                                                 import/gitlab#jobs
#          import_gitlab POST     /import/gitlab(.:format)                                                                      import/gitlab#create
describe Import::GitlabController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:except_actions) { [:new] }
    let(:provider) { 'gitlab' }
  end
end

#   status_import_bitbucket GET      /import/bitbucket/status(.:format)                                                            import/bitbucket#status
# callback_import_bitbucket GET      /import/bitbucket/callback(.:format)                                                          import/bitbucket#callback
#     jobs_import_bitbucket GET      /import/bitbucket/jobs(.:format)                                                              import/bitbucket#jobs
#          import_bitbucket POST     /import/bitbucket(.:format)                                                                   import/bitbucket#create
describe Import::BitbucketController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:except_actions) { [:new] }
    let(:provider) { 'bitbucket' }
  end
end

#          status_import_google_code GET      /import/google_code/status(.:format)                                                          import/google_code#status
#        callback_import_google_code POST     /import/google_code/callback(.:format)                                                        import/google_code#callback
#            jobs_import_google_code GET      /import/google_code/jobs(.:format)                                                            import/google_code#jobs
#    new_user_map_import_google_code GET      /import/google_code/user_map(.:format)                                                        import/google_code#new_user_map
# create_user_map_import_google_code POST     /import/google_code/user_map(.:format)                                                        import/google_code#create_user_map
#                 import_google_code POST     /import/google_code(.:format)                                                                 import/google_code#create
#             new_import_google_code GET      /import/google_code/new(.:format)                                                             import/google_code#new
describe Import::GoogleCodeController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:except_actions) { [:callback] }
    let(:provider) { 'google_code' }
  end

  it 'to #callback' 


  it 'to #new_user_map' 


  it 'to #create_user_map' 

end

#          status_import_fogbugz GET      /import/fogbugz/status(.:format)                                                              import/fogbugz#status
#        callback_import_fogbugz POST     /import/fogbugz/callback(.:format)                                                            import/fogbugz#callback
#            jobs_import_fogbugz GET      /import/fogbugz/jobs(.:format)                                                                import/fogbugz#jobs
#    new_user_map_import_fogbugz GET      /import/fogbugz/user_map(.:format)                                                            import/fogbugz#new_user_map
# create_user_map_import_fogbugz POST     /import/fogbugz/user_map(.:format)                                                            import/fogbugz#create_user_map
#                 import_fogbugz POST     /import/fogbugz(.:format)                                                                     import/fogbugz#create
#             new_import_fogbugz GET      /import/fogbugz/new(.:format)                                                                 import/fogbugz#new
describe Import::FogbugzController, 'routing' do
  it_behaves_like 'importer routing' do
    let(:except_actions) { [:callback] }
    let(:provider) { 'fogbugz' }
  end

  it 'to #callback' 


  it 'to #new_user_map' 


  it 'to #create_user_map' 

end

#     import_gitlab_project POST     /import/gitlab_project(.:format)                                                              import/gitlab_projects#create
#                           POST     /import/gitlab_project(.:format)                                                              import/gitlab_projects#create
# new_import_gitlab_project GET      /import/gitlab_project/new(.:format)                                                          import/gitlab_projects#new
describe Import::GitlabProjectsController, 'routing' do
  it 'to #create' 


  it 'to #new' 

end

