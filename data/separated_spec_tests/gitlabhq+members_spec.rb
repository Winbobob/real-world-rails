require 'spec_helper'

describe API::Members do
  let(:maintainer) { create(:user, username: 'maintainer_user') }
  let(:developer) { create(:user) }
  let(:access_requester) { create(:user) }
  let(:stranger) { create(:user) }

  let(:project) do
    create(:project, :public, :access_requestable, creator_id: maintainer.id, namespace: maintainer.namespace) do |project|
      project.add_developer(developer)
      project.add_maintainer(maintainer)
      project.request_access(access_requester)
    end
  end

  let!(:group) do
    create(:group, :public, :access_requestable) do |group|
      group.add_developer(developer)
      group.add_owner(maintainer)
      group.request_access(access_requester)
    end
  end

  shared_examples 'GET /:source_type/:id/members/(all)' do |source_type, all|
    let(:members_url) do
      "/#{source_type.pluralize}/#{source.id}/members".tap do |url|
        url << "/all" if all
      end
    end

    context "with :source_type == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get api(members_url, stranger) }
      end

      %i[maintainer developer access_requester stranger].each do |type|
        context "when authenticated as a #{type}" do
          it 'returns 200' 

        end
      end

      it 'avoids N+1 queries' 


      it 'does not return invitees' 


      it 'finds members with query string' 


      it 'finds all members with no query specified' 

    end
  end

  describe 'GET /:source_type/:id/members/all', :nested_groups do
    let(:nested_user) { create(:user) }
    let(:project_user) { create(:user) }
    let(:linked_group_user) { create(:user) }
    let!(:project_group_link) { create(:project_group_link, project: project, group: linked_group) }

    let(:project) do
      create(:project, :public, group: nested_group) do |project|
        project.add_developer(project_user)
      end
    end

    let(:linked_group) do
      create(:group) do |linked_group|
        linked_group.add_developer(linked_group_user)
      end
    end

    let(:nested_group) do
      create(:group, parent: group) do |nested_group|
        nested_group.add_developer(nested_user)
      end
    end

    it 'finds all project members including inherited members' 


    it 'finds all group members including inherited members' 

  end

  shared_examples 'GET /:source_type/:id/members/:user_id' do |source_type|
    context "with :source_type == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger) }
      end

      context 'when authenticated as a non-member' do
        %i[access_requester stranger].each do |type|
          context "as a #{type}" do
            it 'returns 200' 

          end
        end
      end
    end
  end

  shared_examples 'POST /:source_type/:id/members' do |source_type|
    context "with :source_type == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          post api("/#{source_type.pluralize}/#{source.id}/members", stranger),
               user_id: access_requester.id, access_level: Member::MAINTAINER
        end
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester stranger developer].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a maintainer/owner' do
        context 'and new member is already a requester' do
          it 'transforms the requester into a proper member' 

        end

        it 'creates a new member' 

      end

      it "returns 409 if member already exists" 


      it 'returns 404 when the user_id is not valid' 


      it 'returns 400 when user_id is not given' 


      it 'returns 400 when access_level is not given' 


      it 'returns 400  when access_level is not valid' 

    end
  end

  shared_examples 'PUT /:source_type/:id/members/:user_id' do |source_type|
    context "with :source_type == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          put api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger),
              access_level: Member::MAINTAINER
        end
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester stranger developer].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a maintainer/owner' do
        it 'updates the member' 

      end

      it 'returns 409 if member does not exist' 


      it 'returns 400 when access_level is not given' 


      it 'returns 400  when access level is not valid' 

    end
  end

  shared_examples 'DELETE /:source_type/:id/members/:user_id' do |source_type|
    context "with :source_type == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { delete api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger) }
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester stranger].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a member and deleting themself' do
        it 'deletes the member' 

      end

      context 'when authenticated as a maintainer/owner' do
        context 'and member is a requester' do
          it 'returns 404' 

        end

        it 'deletes the member' 


        it_behaves_like '412 response' do
          let(:request) { api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", maintainer) }
        end
      end

      it 'returns 404 if member does not exist' 

    end
  end

  [false, true].each do |all|
    it_behaves_like 'GET /:source_type/:id/members/(all)', 'project', all do
      let(:source) { project }
    end

    it_behaves_like 'GET /:source_type/:id/members/(all)', 'group', all do
      let(:source) { group }
    end
  end

  it_behaves_like 'GET /:source_type/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'GET /:source_type/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'POST /:source_type/:id/members', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'POST /:source_type/:id/members', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'PUT /:source_type/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'PUT /:source_type/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'DELETE /:source_type/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'DELETE /:source_type/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  context 'Adding owner to project' do
    it 'returns 403' 

  end
end

