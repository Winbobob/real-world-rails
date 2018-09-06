require 'spec_helper'

#       block_admin_user PUT    /admin/users/:id/block(.:format)       admin/users#block
#     unblock_admin_user PUT    /admin/users/:id/unblock(.:format)     admin/users#unblock
#            admin_users GET    /admin/users(.:format)                 admin/users#index
#                        POST   /admin/users(.:format)                 admin/users#create
#         new_admin_user GET    /admin/users/new(.:format)             admin/users#new
#        edit_admin_user GET    /admin/users/:id/edit(.:format)        admin/users#edit
#             admin_user GET    /admin/users/:id(.:format)             admin/users#show
#                        PUT    /admin/users/:id(.:format)             admin/users#update
#                        DELETE /admin/users/:id(.:format)             admin/users#destroy
describe Admin::UsersController, "routing" do
  it "to #block" 


  it "to #unblock" 


  it "to #index" 


  it "to #show" 


  it "to #create" 


  it "to #new" 


  it "to #edit" 


  it "to #show" 


  it "to #update" 


  it "to #destroy" 

end

#        team_admin_project GET    /admin/projects/:id/team(.:format)        admin/projects#team {id: /[^\/]+/}
# team_update_admin_project PUT    /admin/projects/:id/team_update(.:format) admin/projects#team_update {id: /[^\/]+/}
#            admin_projects GET    /admin/projects(.:format)                 admin/projects#index {id: /[^\/]+/}
#                           POST   /admin/projects(.:format)                 admin/projects#create {id: /[^\/]+/}
#         new_admin_project GET    /admin/projects/new(.:format)             admin/projects#new {id: /[^\/]+/}
#        edit_admin_project GET    /admin/projects/:id/edit(.:format)        admin/projects#edit {id: /[^\/]+/}
#             admin_project GET    /admin/projects/:id(.:format)             admin/projects#show {id: /[^\/]+/}
#                           PUT    /admin/projects/:id(.:format)             admin/projects#update {id: /[^\/]+/}
#                           DELETE /admin/projects/:id(.:format)             admin/projects#destroy {id: /[^\/]+/}
describe Admin::ProjectsController, "routing" do
  it "to #index" 


  it "to #show" 

end

# admin_hook_test GET    /admin/hooks/:id/test(.:format)      admin/hooks#test
#     admin_hooks GET    /admin/hooks(.:format)               admin/hooks#index
#                 POST   /admin/hooks(.:format)               admin/hooks#create
#      admin_hook DELETE /admin/hooks/:id(.:format)           admin/hooks#destroy
#                 PUT    /admin/hooks/:id(.:format)           admin/hooks#update
# edit_admin_hook GET    /admin/hooks/:id(.:format)           admin/hooks#edit
describe Admin::HooksController, "routing" do
  it "to #test" 


  it "to #index" 


  it "to #create" 


  it "to #edit" 


  it "to #update" 


  it "to #destroy" 

end

# admin_hook_hook_log_retry GET    /admin/hooks/:hook_id/hook_logs/:id/retry(.:format) admin/hook_logs#retry
# admin_hook_hook_log       GET    /admin/hooks/:hook_id/hook_logs/:id(.:format)       admin/hook_logs#show
describe Admin::HookLogsController, 'routing' do
  it 'to #retry' 


  it 'to #show' 

end

# admin_logs GET    /admin/logs(.:format) admin/logs#show
describe Admin::LogsController, "routing" do
  it "to #show" 

end

# admin_background_jobs GET    /admin/background_jobs(.:format) admin/background_jobs#show
describe Admin::BackgroundJobsController, "routing" do
  it "to #show" 

end

# admin_root        /admin(.:format) admin/dashboard#index
describe Admin::DashboardController, "routing" do
  it "to #index" 

end

# admin_health_check GET    /admin/health_check(.:format) admin/health_check#show
describe Admin::HealthCheckController, "routing" do
  it "to #show" 

end

describe Admin::GroupsController, "routing" do
  let(:name) { 'complex.group-namegit' }

  it "to #index" 


  it "to #show" 


  it "to #edit" 

end

