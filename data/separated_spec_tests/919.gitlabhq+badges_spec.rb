require 'spec_helper'

describe API::Badges do
  let(:maintainer) { create(:user, username: 'maintainer_user') }
  let(:developer) { create(:user) }
  let(:access_requester) { create(:user) }
  let(:stranger) { create(:user) }
  let(:project_group) { create(:group) }
  let(:project) { setup_project }
  let!(:group) { setup_group }

  shared_context 'source helpers' do
    def get_source(source_type)
      source_type == 'project' ? project : group
    end
  end

  shared_examples 'GET /:sources/:id/badges' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }

    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get api("/#{source_type.pluralize}/#{source.id}/badges", stranger) }
      end

      %i[maintainer developer access_requester stranger].each do |type|
        context "when authenticated as a #{type}" do
          it 'returns 200' 

        end
      end

      it 'avoids N+1 queries' 

    end
  end

  shared_examples 'GET /:sources/:id/badges/:badge_id' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }

    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) { get api("/#{source_type.pluralize}/#{source.id}/badges/#{developer.id}", stranger) }
      end

      context 'when authenticated as a non-member' do
        %i[maintainer developer access_requester stranger].each do |type|
          let(:badge) { source.badges.first }

          context "as a #{type}" do
            it 'returns 200' 

          end
        end
      end
    end
  end

  shared_examples 'POST /:sources/:id/badges' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }
    let(:example_url) { 'http://www.example.com' }
    let(:example_url2) { 'http://www.example1.com' }

    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          post api("/#{source_type.pluralize}/#{source.id}/badges", stranger),
               link_url: example_url, image_url: example_url2
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
        it 'creates a new badge' 

      end

      it 'returns 400 when link_url is not given' 


      it 'returns 400 when image_url is not given' 


      it 'returns 400 when link_url or image_url is not valid' 

    end
  end

  shared_examples 'PUT /:sources/:id/badges/:badge_id' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }

    context "with :sources == #{source_type.pluralize}" do
      let(:badge) { source.badges.first }
      let(:example_url) { 'http://www.example.com' }
      let(:example_url2) { 'http://www.example1.com' }

      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          put api("/#{source_type.pluralize}/#{source.id}/badges/#{badge.id}", stranger),
              link_url: example_url
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

      it 'returns 400 when link_url or image_url is not valid' 

    end
  end

  shared_examples 'DELETE /:sources/:id/badges/:badge_id' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }

    context "with :sources == #{source_type.pluralize}" do
      let(:badge) { source.badges.first }

      it_behaves_like 'a 404 response when source is private' do
        let(:route) { delete api("/#{source_type.pluralize}/#{source.id}/badges/#{badge.id}", stranger) }
      end

      context 'when authenticated as a non-member or member with insufficient rights' do
        %i[access_requester developer stranger].each do |type|
          context "as a #{type}" do
            it 'returns 403' 

          end
        end
      end

      context 'when authenticated as a maintainer/owner' do
        it 'deletes the badge' 


        it_behaves_like '412 response' do
          let(:request) { api("/#{source_type.pluralize}/#{source.id}/badges/#{badge.id}", maintainer) }
        end
      end

      it 'returns 404 if badge does not exist' 

    end
  end

  shared_examples 'GET /:sources/:id/badges/render' do |source_type|
    include_context 'source helpers'

    let(:source) { get_source(source_type) }
    let(:example_url) { 'http://www.example.com' }
    let(:example_url2) { 'http://www.example1.com' }

    context "with :sources == #{source_type.pluralize}" do
      it_behaves_like 'a 404 response when source is private' do
        let(:route) do
          get api("/#{source_type.pluralize}/#{source.id}/badges/render?link_url=#{example_url}&image_url=#{example_url2}", stranger)
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
        it 'gets the rendered badge values' 

      end

      it 'returns 400 when link_url is not given' 


      it 'returns 400 when image_url is not given' 


      it 'returns 400 when link_url or image_url is not valid' 

    end
  end

  context 'when deleting a badge' do
    context 'and the source is a project' do
      it 'cannot delete badges owned by the project group' 

    end
  end

  describe 'Endpoints' do
    %w(project group).each do |source_type|
      it_behaves_like 'GET /:sources/:id/badges', source_type
      it_behaves_like 'GET /:sources/:id/badges/:badge_id', source_type
      it_behaves_like 'GET /:sources/:id/badges/render', source_type
      it_behaves_like 'POST /:sources/:id/badges', source_type
      it_behaves_like 'PUT /:sources/:id/badges/:badge_id', source_type
      it_behaves_like 'DELETE /:sources/:id/badges/:badge_id', source_type
    end
  end

  def setup_project
    create(:project, :public, :access_requestable, creator_id: maintainer.id, namespace: project_group) do |project|
      project.add_developer(developer)
      project.add_maintainer(maintainer)
      project.request_access(access_requester)
      project.project_badges << build(:project_badge, project: project)
      project.project_badges << build(:project_badge, project: project)
      project_group.badges << build(:group_badge, group: group)
    end
  end

  def setup_group
    create(:group, :public, :access_requestable) do |group|
      group.add_developer(developer)
      group.add_owner(maintainer)
      group.request_access(access_requester)
      group.badges << build(:group_badge, group: group)
      group.badges << build(:group_badge, group: group)
    end
  end
end

