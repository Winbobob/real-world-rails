require 'spec_helper'

describe Gitlab::LegacyGithubImport::CommentFormatter do
  let(:client) { double }
  let(:project) { create(:project) }
  let(:octocat) { double(id: 123456, login: 'octocat', email: 'octocat@example.com') }
  let(:created_at) { DateTime.strptime('2013-04-10T20:09:31Z') }
  let(:updated_at) { DateTime.strptime('2014-03-03T18:58:10Z') }
  let(:base) do
    {
      body: "I'm having a problem with this.",
      user: octocat,
      commit_id: nil,
      diff_hunk: nil,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  subject(:comment) { described_class.new(project, raw, client) }

  before do
    allow(client).to receive(:user).and_return(octocat)
  end

  describe '#attributes' do
    context 'when do not reference a portion of the diff' do
      let(:raw) { double(base) }

      it 'returns formatted attributes' 

    end

    context 'when on a portion of the diff' do
      let(:diff) do
        {
          body: 'Great stuff',
          commit_id: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
          diff_hunk: "@@ -1,5 +1,9 @@\n class User\n   def name\n-    'John Doe'\n+    'Jane Doe'",
          path: 'file1.txt'
        }
      end

      let(:raw) { double(base.merge(diff)) }

      it 'returns formatted attributes' 

    end

    context 'when author is a GitLab user' do
      let(:raw) { double(base.merge(user: octocat)) }

      it 'returns GitLab user id associated with GitHub id as author_id' 


      it 'returns GitLab user id associated with GitHub email as author_id' 


      it 'returns note without created at tag line' 

    end
  end
end

