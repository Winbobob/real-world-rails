require 'spec_helper'

describe 'projects/diffs/_stats.html.haml' do
  let(:project) { create(:project, :repository) }
  let(:commit) { project.commit('570e7b2abdd848b95f2f578043fc23bd6f6fd24d') }

  def render_view
    render partial: "projects/diffs/stats", locals: { diff_files: commit.diffs.diff_files }
  end

  context 'when the commit contains several changes' do
    it 'uses plural for additions' 


    it 'uses plural for deletions' 

  end

  context 'when the commit contains no addition and no deletions' do
    let(:commit) { project.commit('4cd80ccab63c82b4bad16faa5193fbd2aa06df40') }

    it 'uses plural for additions' 


    it 'uses plural for deletions' 

  end

  context 'when the commit contains exactly one addition and one deletion' do
    let(:commit) { project.commit('08f22f255f082689c0d7d39d19205085311542bc') }

    it 'uses singular for additions' 


    it 'uses singular for deletions' 

  end
end

