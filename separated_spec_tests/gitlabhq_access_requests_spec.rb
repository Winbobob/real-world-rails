require 'spec_helper'

describe API::AccessRequests do
  set(:master) { create(:user) }
  set(:developer) { create(:user) }
  set(:access_requester) { create(:user) }
  set(:stranger) { create(:user) }

  set(:project) do
    create(:project, :public, :access_requestable, creator_id: master.id, namespace: master.namespace) do |project|
      project.add_developer(developer)
      project.add_master(master)
      project.request_access(access_requester)
    end
  end

  set(:group) do
    create(:group, :public, :access_requestable) do |group|
      group.add_developer(developer)
      group.add_owner(master)
      group.request_access(access_requester)
    end
  end

  shared_examples 'GET /:sources/:id/access_requests' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get api("/#{source_type.pluralize}/#{source.id}/access_requests", stranger) }
      end

      context 'when authenticated as a non-master/owner' do
        %i[developer access_requester stranger].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a master/owner' do
        it 'returns access requesters' 

      end
    end
  end

  shared_examples 'POST /:sources/:id/access_requests' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { post api("/#{source_type.pluralize}/#{source.id}/access_requests", stranger) }
      end

      context 'when authenticated as a member' do
        %i[developer master].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as an access requester' do
        it 'returns 400' 

      end

      context 'when authenticated as a stranger' do
        context "when access request is disabled for the #{source_type}" do
          before do
            source.update_attributes(request_access_enabled: false)
          end

          it 'returns 403' 

        end

        it 'returns 201' 

      end
    end
  end

  shared_examples 'PUT /:sources/:id/access_requests/:user_id/approve' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { put api("/#{source_type.pluralize}/#{source.id}/access_requests/#{access_requester.id}/approve", stranger) }
      end

      context 'when authenticated as a non-master/owner' do
        %i[developer access_requester stranger].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a master/owner' do
        it 'returns 201' 


        context 'user_id does not match an existing access requester' do
          it 'returns 404' 

        end
      end
    end
  end

  shared_examples 'DELETE /:sources/:id/access_requests/:user_id' do |source_type|
    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { delete api("/#{source_type.pluralize}/#{source.id}/access_requests/#{access_requester.id}", stranger) }
      end

      context 'when authenticated as a non-master/owner' do
        %i[developer stranger].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as the access requester' do
        it 'deletes the access requester' 

      end

      context 'when authenticated as a master/owner' do
        it 'deletes the access requester' 


        context 'user_id matches a member, not an access requester' do
          it 'returns 404' 

        end

        context 'user_id does not match an existing access requester' do
          it 'returns 404' 

        end
      end
    end
  end

  it_behaves_like 'GET /:sources/:id/access_requests', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'GET /:sources/:id/access_requests', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'POST /:sources/:id/access_requests', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'POST /:sources/:id/access_requests', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'PUT /:sources/:id/access_requests/:user_id/approve', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'PUT /:sources/:id/access_requests/:user_id/approve', 'group' do
    let(:source) { group }
  end

  it_behaves_like 'DELETE /:sources/:id/access_requests/:user_id', 'project' do
    let(:source) { project }
  end

  it_behaves_like 'DELETE /:sources/:id/access_requests/:user_id', 'group' do
    let(:source) { group }
  end
end

