# frozen_string_literal: true

require 'spec_helper'

describe Emails::AutoDevops do
  include EmailSpec::Matchers

  describe '#auto_devops_disabled_email' do
    let(:owner) { create(:user) }
    let(:namespace) { create(:namespace, owner: owner) }
    let(:project) { create(:project, :repository, :auto_devops) }
    let(:pipeline) { create(:ci_pipeline, :failed, project: project) }

    subject { Notify.autodevops_disabled_email(pipeline, owner.email) }

    it 'sents email with correct subject' 


    it 'sents an email to the user' 


    it 'is sent as GitLab email' 

  end
end

