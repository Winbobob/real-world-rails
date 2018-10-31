require 'spec_helper'

describe PipelineNotificationWorker, :mailer do
  let(:pipeline) { create(:ci_pipeline) }

  describe '#execute' do
    it 'calls NotificationService#pipeline_finished when the pipeline exists' 


    it 'does nothing when the pipeline does not exist' 

  end
end

