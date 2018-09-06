require 'spec_helper'

describe EventFilter do
  describe '#apply_filter' do
    let(:source_user) { create(:user) }
    let!(:public_project) { create(:project, :public) }

    let!(:push_event)     { create(:push_event,        project: public_project, author: source_user) }
    let!(:merged_event)   { create(:event, :merged,    project: public_project, target: public_project, author: source_user) }
    let!(:created_event)  { create(:event, :created,   project: public_project, target: public_project, author: source_user) }
    let!(:updated_event)  { create(:event, :updated,   project: public_project, target: public_project, author: source_user) }
    let!(:closed_event)   { create(:event, :closed,    project: public_project, target: public_project, author: source_user) }
    let!(:reopened_event) { create(:event, :reopened,  project: public_project, target: public_project, author: source_user) }
    let!(:comments_event) { create(:event, :commented, project: public_project, target: public_project, author: source_user) }
    let!(:joined_event)   { create(:event, :joined,    project: public_project, target: public_project, author: source_user) }
    let!(:left_event)     { create(:event, :left,      project: public_project, target: public_project, author: source_user) }

    it 'applies push filter' 


    it 'applies merged filter' 


    it 'applies issue filter' 


    it 'applies comments filter' 


    it 'applies team filter' 


    it 'applies all filter' 


    it 'applies no filter' 


    it 'applies unknown filter' 

  end
end

