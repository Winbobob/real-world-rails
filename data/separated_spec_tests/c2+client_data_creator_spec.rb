describe ClientDataCreator do
  include ActionDispatch::TestProcess

  describe "#run" do
    # TODO: Fix this brittle test
    #
    # it "saves the model instance" do
    #   client_data_instance = build(:ncr_work_order)
    #   user = create(:user)
    #
    #   expect {
    #     ClientDataCreator.new(client_data_instance, user).run
    #   }.to change { Ncr::WorkOrder.count }.from(0).to(1)
    # end

    it "saves the proposal for the user passed in" 


    it "saves the public_id for the proposal created" 


    it "creates attachments for the proposal if attachments present" 


    it "does not error on missing attachments" 

  end
end

