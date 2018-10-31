require 'rails_helper'

describe Banzai::Pipeline::GfmPipeline do
  describe 'integration between parsing regular and external issue references' do
    let(:project) { create(:redmine_project, :public) }

    context 'when internal issue tracker is enabled' do
      context 'when shorthand pattern #ISSUE_ID is used' do
        it 'links an internal issue  if it exists' 


        it 'does not link any issue if it does not exist on GitLab' 

      end

      it 'allows to use long external reference syntax for Redmine' 


      it 'parses cross-project references to regular issues' 

    end

    context 'when internal issue tracker is disabled' do
      before do
        project.issues_enabled = false
        project.save!
      end

      it 'allows to use shorthand external reference syntax for Redmine' 


      it 'allows to use long external reference syntax for Redmine' 


      it 'parses cross-project references to regular issues' 

    end
  end

  describe 'markdown link or image urls having spaces' do
    let(:project) { create(:project, :public) }

    it 'rewrites links with spaces in url' 


    it 'rewrites images with spaces in url' 

  end
end

