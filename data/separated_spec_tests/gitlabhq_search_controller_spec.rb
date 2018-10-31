require 'spec_helper'

describe SearchController do
  let(:user)    { create(:user) }

  before do
    sign_in(user)
  end

  it 'finds issue comments' 


  context 'when the user cannot read cross project' do
    before do
      allow(Ability).to receive(:allowed?).and_call_original
      allow(Ability).to receive(:allowed?)
                          .with(user, :read_cross_project, :global) { false }
    end

    it 'still allows accessing the search page' 


    it 'still blocks searches without a project_id' 


    it 'allows searches with a project_id' 

  end

  context 'on restricted projects' do
    context 'when signed out' do
      before do
        sign_out(user)
      end

      it "doesn't expose comments on issues" 

    end

    it "doesn't expose comments on merge_requests" 


    it "doesn't expose comments on snippets" 

  end
end

