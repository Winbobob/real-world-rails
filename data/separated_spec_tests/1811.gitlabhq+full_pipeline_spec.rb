require 'rails_helper'

describe Banzai::Pipeline::FullPipeline do
  describe 'References' do
    let(:project) { create(:project, :public) }
    let(:issue)   { create(:issue, project: project) }

    it 'handles markdown inside a reference' 


    it 'sanitizes reference HTML' 


    it 'escapes the data-original attribute on a reference' 

  end
end

