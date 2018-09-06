require 'spec_helper'

describe Banzai::ReferenceParser::UserParser do
  include ReferenceParserHelpers

  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, group: group, creator: user) }
  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  describe '#referenced_by' do
    context 'when the link has a data-group attribute' do
      context 'using an existing group ID' do
        before do
          link['data-group'] = project.group.id.to_s
        end

        it 'returns the users of the group' 


        it 'returns an empty Array when the group has no users' 

      end

      context 'using a non-existing group ID' do
        it 'returns an empty Array' 

      end
    end

    context 'when the link has a data-user attribute' do
      it 'returns an Array of users' 


      context 'when RequestStore is active', :request_store do
        let(:other_user) { create(:user) }

        it 'does not return users from the first call in the second' 

      end
    end

    context 'when the link has a data-project attribute' do
      context 'using an existing project ID' do
        let(:contributor) { create(:user) }

        before do
          project.add_developer(user)
          project.add_developer(contributor)
        end

        it 'returns the members of a project' 

      end

      context 'using a non-existing project ID' do
        it 'returns an empty Array' 

      end
    end
  end

  describe '#nodes_visible_to_user' do
    context 'when the link has a data-group attribute' do
      context 'using an existing group ID' do
        before do
          link['data-group'] = group.id.to_s
        end

        it 'returns the nodes if the user can read the group' 


        it 'returns an empty Array if the user can not read the group' 

      end

      context 'when the link does not have a data-group attribute' do
        context 'with a data-project attribute' do
          it 'returns the nodes if the attribute value equals the current project ID' 


          it 'returns the nodes if the user can read the project' 


          it 'returns an empty Array if the user can not read the project' 

        end

        context 'without a data-project attribute' do
          it 'returns the nodes' 

        end
      end
    end
  end

  describe '#nodes_user_can_reference' do
    context 'when the link has a data-author attribute' do
      it 'returns the nodes when the user is a member of the project' 


      it 'returns an empty Array when the project could not be found' 


      it 'returns an empty Array when the user could not be found' 


      it 'returns an empty Array when the user is not a team member' 


      it 'returns the nodes if the project attribute value equals the current project ID' 

    end

    context 'when the link does not have a data-author attribute' do
      it 'returns the nodes' 

    end
  end
end

