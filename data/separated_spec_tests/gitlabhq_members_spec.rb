require 'spec_helper'

describe API::V3::Members do
  let(:master) { create(:user, username: 'master_user') }
  let(:developer) { create(:user) }
  let(:access_requester) { create(:user) }
  let(:stranger) { create(:user) }

  let(:project) do
    create(:project, :public, :access_requestable, creator_id: master.id, namespace: master.namespace) do |project|
      project.add_developer(developer)
      project.add_master(master)
      project.request_access(access_requester)
    end
  end

  let!(:group) do
    create(:group, :public, :access_requestable) do |group|
      group.add_developer(developer)
      group.add_owner(master)
      group.request_access(access_requester)
    end
  end

  shared_examples 'GET /:sources/:id/members' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get v3_api("/#{source_type.pluralize}/#{source.id}/members", stranger) }
      end

      %i[master developer access_requester stranger].each do |type|
        context "when authenticated as a #{type}" do
          it 'returns 200' 

        end
      end

      it 'does not return invitees' 


      it 'finds members with query string' 


      it 'finds all members with no query specified' 

    end
  end

  shared_examples 'GET /:sources/:id/members/:user_id' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get v3_api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger) }
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

  shared_examples 'POST /:sources/:id/members' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          post v3_api("/#{source_type.pluralize}/#{source.id}/members", stranger),
               user_id: access_requester.id, access_level: Member::MASTER
        end
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester stranger developer].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a master/owner' do
        context 'and new member is already a requester' do
          it 'transforms the requester into a proper member' 

        end

        it 'creates a new member' 

      end

      it "returns #{source_type == 'project' ? 201 : 409} if member already exists" 


      it 'returns 400 when user_id is not given' 


      it 'returns 400 when access_level is not given' 


      it 'returns 422 when access_level is not valid' 

    end
  end

  shared_examples 'PUT /:sources/:id/members/:user_id' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          put v3_api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger),
              access_level: Member::MASTER
        end
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester stranger developer].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a master/owner' do
        it 'updates the member' 

      end

      it 'returns 409 if member does not exist' 


      it 'returns 400 when access_level is not given' 


      it 'returns 422 when access level is not valid' 

    end
  end

  shared_examples 'DELETE /:sources/:id/members/:user_id' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { delete v3_api("/#{source_type.pluralize}/#{source.id}/members/#{developer.id}", stranger) }
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

      context 'when authenticated as a master/owner' do
        context 'and member is a requester' do
          it "returns #{source_type == 'project' ? 200 : 404}" 

        end

        it 'deletes the member' 

      end

      it "returns #{source_type == 'project' ? 200 : 404} if member does not exist" 

    end
  end

  it_behaves_like 'GET /:sources/:id/members', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'GET /:sources/:id/members', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'GET /:sources/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'GET /:sources/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'POST /:sources/:id/members', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'POST /:sources/:id/members', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'PUT /:sources/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'PUT /:sources/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'DELETE /:sources/:id/members/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'DELETE /:sources/:id/members/:user_id', 'group' do
    let(:source) { group }
  end

  context 'Adding owner to project' do
    it 'returns 403' 

  end
end

