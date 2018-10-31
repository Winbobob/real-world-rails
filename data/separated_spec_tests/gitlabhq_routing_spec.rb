require 'spec_helper'

# user                       GET    /u/:username/
# user_groups                GET    /u/:username/groups(.:format)
# user_projects              GET    /u/:username/projects(.:format)
# user_contributed_projects  GET    /u/:username/contributed(.:format)
# user_snippets              GET    /u/:username/snippets(.:format)
# user_calendar              GET    /u/:username/calendar(.:format)
# user_calendar_activities   GET    /u/:username/calendar_activities(.:format)
describe UsersController, "routing" do
  it "to #show" 


  it "to #groups" 


  it "to #projects" 


  it "to #contributed" 


  it "to #snippets" 


  it "to #calendar" 


  it "to #calendar_activities" 


  describe 'redirect alias routes' do
    include RSpec::Rails::RequestExampleGroup

    it '/u/user1 redirects to /user1' 


    it '/u/user1/groups redirects to /user1/groups' 


    it '/u/user1/projects redirects to /user1/projects' 

  end
end

# search GET    /search(.:format) search#show
describe SearchController, "routing" do
  it "to #show" 

end

# gitlab_api /api         API::API
#            /:path       Grack
describe "Mounted Apps", "routing" do
  it "to API" 


  it "to Grack" 

end

#     snippets GET    /snippets(.:format)          snippets#index
#          POST   /snippets(.:format)          snippets#create
#  new_snippet GET    /snippets/new(.:format)      snippets#new
# edit_snippet GET    /snippets/:id/edit(.:format) snippets#edit
#      snippet GET    /snippets/:id(.:format)      snippets#show
#          PUT    /snippets/:id(.:format)      snippets#update
#          DELETE /snippets/:id(.:format)      snippets#destroy
describe SnippetsController, "routing" do
  it "to #raw" 


  it "to #index" 


  it "to #create" 


  it "to #new" 


  it "to #edit" 


  it "to #show" 


  it "to #update" 


  it "to #destroy" 

end

#            help GET /help(.:format)                 help#index
#       help_page GET /help/*path(.:format)           help#show
#  help_shortcuts GET /help/shortcuts(.:format)       help#shortcuts
#         help_ui GET /help/ui(.:format)              help#ui
describe HelpController, "routing" do
  it "to #index" 


  it 'to #show' 

end

#                      koding GET    /koding(.:format)                      koding#index
describe KodingController, "routing" do
  it "to #index" 

end

#             profile_account GET    /profile/account(.:format)             profile#account
#             profile_history GET    /profile/history(.:format)             profile#history
#            profile_password PUT    /profile/password(.:format)            profile#password_update
#               profile_token GET    /profile/token(.:format)               profile#token
#                     profile GET    /profile(.:format)                     profile#show
#              profile_update PUT    /profile/update(.:format)              profile#update
describe ProfilesController, "routing" do
  it "to #account" 


  it "to #audit_log" 


  it "to #reset_rss_token" 


  it "to #show" 

end

# profile_preferences GET      /profile/preferences(.:format) profiles/preferences#show
#                     PATCH    /profile/preferences(.:format) profiles/preferences#update
#                     PUT      /profile/preferences(.:format) profiles/preferences#update
describe Profiles::PreferencesController, 'routing' do
  it 'to #show' 


  it 'to #update' 

end

#     keys GET    /keys(.:format)          keys#index
#          POST   /keys(.:format)          keys#create
# edit_key GET    /keys/:id/edit(.:format) keys#edit
#      key GET    /keys/:id(.:format)      keys#show
#          PUT    /keys/:id(.:format)      keys#update
#          DELETE /keys/:id(.:format)      keys#destroy
describe Profiles::KeysController, "routing" do
  it "to #index" 


  it "to #create" 


  it "to #show" 


  it "to #destroy" 


  # get all the ssh-keys of a user
  it "to #get_keys" 

end

#   emails GET    /emails(.:format)        emails#index
#          POST   /keys(.:format)          emails#create
#          DELETE /keys/:id(.:format)      keys#destroy
describe Profiles::EmailsController, "routing" do
  it "to #index" 


  it "to #create" 


  it "to #destroy" 

end

# profile_avatar DELETE /profile/avatar(.:format) profiles/avatars#destroy
describe Profiles::AvatarsController, "routing" do
  it "to #destroy" 

end

#                dashboard GET    /dashboard(.:format)                dashboard#show
#         dashboard_issues GET    /dashboard/issues(.:format)         dashboard#issues
# dashboard_merge_requests GET    /dashboard/merge_requests(.:format) dashboard#merge_requests
describe DashboardController, "routing" do
  it "to #index" 


  it "to #issues" 


  it "to #merge_requests" 

end

#                     root        /                                   root#show
describe RootController, 'routing' do
  it 'to #index' 

end

describe "Authentication", "routing" do
  it "GET /users/sign_in" 


  it "POST /users/sign_in" 


  # sign_out with GET instead of DELETE facilitates ad-hoc single-sign-out processes
  # (https://gitlab.com/gitlab-org/gitlab-ce/issues/39708)
  it "GET /users/sign_out" 


  it "POST /users/password" 


  it "GET /users/password/new" 


  it "GET /users/password/edit" 


  it "PUT /users/password" 

end

describe HealthCheckController, 'routing' do
  it 'to #index' 


  it 'also supports passing checks in the url' 

end

