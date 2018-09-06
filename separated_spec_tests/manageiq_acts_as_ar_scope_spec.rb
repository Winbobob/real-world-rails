describe ActsAsArScope do
  context "AR backed model" do
    # model contains ids of important vms - acts like ar model
    let(:important_vm_model) do
      Class.new(ActsAsArScope) do
        def self.vm_ids
          @vm_ids ||= []
        end

        def self.vm_ids=(new_ids)
          @vm_ids = new_ids
        end

        def self.aar_scope
          Vm.where(:id => vm_ids)
        end
      end
    end

    it "delegates to :aar_scope" 

  end
end

