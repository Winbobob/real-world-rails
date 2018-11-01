class DashboardController < ApplicationController
  include ContextFreeRepos

  expose(:projects) { projects_repository.active_with_memberships.order(:name) }
  expose(:projects_json) do
    ActiveModel::ArraySerializer.new(
      projects.decorate,
      each_serializer: ProjectSerializer
    ).as_json
  end
  expose(:users) do
    User.includes(:memberships, :primary_roles).active.order(:last_name, :first_name)
  end
  expose(:users_json) do
    ActiveModel::ArraySerializer.new(
      users.decorate,
      each_serializer: UserSerializer
    ).as_json
  end
  expose(:roles) { Role.order(:name) }
  expose(:roles_json) { roles.as_json }
  expose(:memberships) do
    Membership.where(project_id: projects.ids, user_id: users.ids)
  end
  expose(:memberships_json) do
    memberships.decorate.as_json
  end
  expose(:note)

  before_action :set_time_gon

  def active
    self.projects = projects_repository.active_with_memberships.order(:name)
    render :index
  end

  def potential
    self.projects = projects_repository.potential.order(:name)
    render :index
  end

  def archived
    self.projects = projects_repository.archived.order(:name)
    render :index
  end

  private

  def set_time_gon
    gon.currentTime = Time.now
  end
end
