describe PaypalService::Store::ProcessToken do

  ProcessTokenStore = PaypalService::Store::ProcessToken

  CID = 10
  PAYPAL_TOKEN = "paypal_token"
  TX_ID = 1001

  context "#create" do

    it "saves a new token with given info and generated process_token uuid" 


    it "prevents creating token for same community id, transaction id and op_name twice" 


    it "uniqueness is a combination of community id, transaction id and op_name" 


    it "serializes op_input" 


    it "can be queried by community_id, transaction_id and op_name" 

  end

  context "#update_to_completed" do

    before(:each) do
      @proc_token = ProcessTokenStore.create(
        community_id: CID,
        transaction_id: TX_ID,
        op_name: :create)
    end

    it "sets op_completed" 


    it "serializes op_output" 


    it "raises error if called for non-existent process token" 


  end
end

