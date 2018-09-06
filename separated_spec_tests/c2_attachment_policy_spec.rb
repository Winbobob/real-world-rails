describe AttachmentPolicy do
  subject { described_class }
  let(:proposal) { create(:proposal, :with_parallel_approvers, :with_observers) }
  let(:attachment) { create(:attachment, proposal: proposal) } 

  permissions :can_destroy? do
    it "allows the original uploader to delete" 


    it "does not allow anyone else to delete" 

  end
end

