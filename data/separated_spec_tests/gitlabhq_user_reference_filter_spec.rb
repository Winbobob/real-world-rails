require 'spec_helper'

describe Banzai::Filter::UserReferenceFilter do
  include FilterSpecHelper

  let(:project)   { create(:project, :public) }
  let(:user)      { create(:user) }
  let(:reference) { user.to_reference }

  it 'requires project context' 


  it 'ignores invalid users' 


  it 'ignores references with text before the @ sign' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  context 'mentioning @all' do
    it_behaves_like 'a reference containing an element node'

    let(:reference) { User.reference_prefix + 'all' }

    before do
      project.add_developer(project.creator)
    end

    it 'supports a special @all mention' 


    it 'includes a data-author attribute when there is an author' 


    it 'does not include a data-author attribute when there is no author' 


    it 'ignores reference to all when the user is not a project member' 

  end

  context 'mentioning a user' do
    it_behaves_like 'a reference containing an element node'

    it 'links to a User' 


    it 'links to a User with a period' 


    it 'links to a User with an underscore' 


    it 'links to a User with different case-sensitivity' 


    it 'includes a data-user attribute' 

  end

  context 'mentioning a group' do
    it_behaves_like 'a reference containing an element node'

    let(:group)     { create(:group) }
    let(:reference) { group.to_reference }

    it 'links to the Group' 


    it 'includes a data-group attribute' 

  end

  context 'mentioning a nested group' do
    it_behaves_like 'a reference containing an element node'

    let(:group)     { create(:group, :nested) }
    let(:reference) { group.to_reference }

    it 'links to the nested group' 


    it 'has the full group name as a title' 

  end

  it 'links with adjacent text' 


  it 'includes default classes' 


  it 'supports an :only_path context' 


  context 'referencing a user in a link href' do
    let(:reference) { %Q{<a href="#{user.to_reference}">User</a>} }

    it 'links to a User' 


    it 'links with adjacent text' 


    it 'includes a data-user attribute' 

  end

  context 'when a project is not specified' do
    let(:project) { nil }

    it 'does not link a User' 


    context 'when skip_project_check set to true' do
      it 'links to a User' 


      it 'does not link users using @all reference' 

    end
  end

  context 'in group context' do
    let(:group) { create(:group) }
    let(:group_member) { create(:user) }

    before do
      group.add_developer(group_member)
    end

    let(:context) { { author: group_member, project: nil, group: group } }

    it 'supports a special @all mention' 


    it 'supports mentioning a single user' 


    it 'supports mentioning a group' 

  end

  describe '#namespaces' do
    it 'returns a Hash containing all Namespaces' 

  end

  describe '#usernames' do
    it 'returns the usernames mentioned in a document' 

  end
end

