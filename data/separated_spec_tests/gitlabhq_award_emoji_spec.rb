require 'spec_helper'

describe API::V3::AwardEmoji do
  set(:user)           { create(:user) }
  set(:project)        { create(:project) }
  set(:issue)          { create(:issue, project: project) }
  set(:award_emoji)    { create(:award_emoji, awardable: issue, user: user) }
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
  let!(:downvote)      { create(:award_emoji, :downvote, awardable: merge_request, user: user) }
  set(:note)           { create(:note, project: project, noteable: issue) }

  before { project.add_master(user) }

  describe "GET /projects/:id/awardable/:awardable_id/award_emoji" do
    context 'on an issue' do
      it "returns an array of award_emoji" 


      it "returns a 404 error when issue id not found" 

    end

    context 'on a merge request' do
      it "returns an array of award_emoji" 

    end

    context 'on a snippet' do
      let(:snippet) { create(:project_snippet, :public, project: project) }
      let!(:award)  { create(:award_emoji, awardable: snippet) }

      it 'returns the awarded emoji' 

    end

    context 'when the user has no access' do
      it 'returns a status code 404' 

    end
  end

  describe 'GET /projects/:id/awardable/:awardable_id/notes/:note_id/award_emoji' do
    let!(:rocket)  { create(:award_emoji, awardable: note, name: 'rocket') }

    it 'returns an array of award emoji' 

  end

  describe "GET /projects/:id/awardable/:awardable_id/award_emoji/:award_id" do
    context 'on an issue' do
      it "returns the award emoji" 


      it "returns a 404 error if the award is not found" 

    end

    context 'on a merge request' do
      it 'returns the award emoji' 

    end

    context 'on a snippet' do
      let(:snippet) { create(:project_snippet, :public, project: project) }
      let!(:award)  { create(:award_emoji, awardable: snippet) }

      it 'returns the awarded emoji' 

    end

    context 'when the user has no access' do
      it 'returns a status code 404' 

    end
  end

  describe 'GET /projects/:id/awardable/:awardable_id/notes/:note_id/award_emoji/:award_id' do
    let!(:rocket)  { create(:award_emoji, awardable: note, name: 'rocket') }

    it 'returns an award emoji' 

  end

  describe "POST /projects/:id/awardable/:awardable_id/award_emoji" do
    let(:issue2)  { create(:issue, project: project, author: user) }

    context "on an issue" do
      it "creates a new award emoji" 


      it "returns a 400 bad request error if the name is not given" 


      it "returns a 401 unauthorized error if the user is not authenticated" 


      it "returns a 404 error if the user authored issue" 


      it "normalizes +1 as thumbsup award" 


      context 'when the emoji already has been awarded' do
        it 'returns a 404 status code' 

      end
    end

    context 'on a snippet' do
      it 'creates a new award emoji' 

    end
  end

  describe "POST /projects/:id/awardable/:awardable_id/notes/:note_id/award_emoji" do
    let(:note2)  { create(:note, project: project, noteable: issue, author: user) }

    it 'creates a new award emoji' 


    it "it returns 404 error when user authored note" 


    it "normalizes +1 as thumbsup award" 


    context 'when the emoji already has been awarded' do
      it 'returns a 404 status code' 

    end
  end

  describe 'DELETE /projects/:id/awardable/:awardable_id/award_emoji/:award_id' do
    context 'when the awardable is an Issue' do
      it 'deletes the award' 


      it 'returns a 404 error when the award emoji can not be found' 

    end

    context 'when the awardable is a Merge Request' do
      it 'deletes the award' 


      it 'returns a 404 error when note id not found' 

    end

    context 'when the awardable is a Snippet' do
      let(:snippet) { create(:project_snippet, :public, project: project) }
      let!(:award)  { create(:award_emoji, awardable: snippet, user: user) }

      it 'deletes the award' 

    end
  end

  describe 'DELETE /projects/:id/awardable/:awardable_id/award_emoji/:award_emoji_id' do
    let!(:rocket)  { create(:award_emoji, awardable: note, name: 'rocket', user: user) }

    it 'deletes the award' 

  end
end

