require 'spec_helper'

describe DeleteDiffFilesWorker do
  describe '#perform' do
    let(:merge_request) { create(:merge_request) }
    let(:merge_request_diff) { merge_request.merge_request_diff }

    it 'deletes all merge request diff files' 


    it 'updates state to without_files' 


    it 'does nothing if diff was already marked as "without_files"' 


    it 'rollsback if something goes wrong' 

  end
end

