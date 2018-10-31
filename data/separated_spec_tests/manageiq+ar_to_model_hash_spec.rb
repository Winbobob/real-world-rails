describe ToModelHash do
  context "#to_model_hash" do
    let(:test_disk_class) do
      Class.new(ActiveRecord::Base) do
        include ToModelHash
        self.table_name = "test_disks"
      end
    end

    let(:test_hardware_class) do
      Class.new(ActiveRecord::Base) do
        include ToModelHash
        self.table_name = "test_hardwares"
      end
    end

    let(:test_vm_class) do
      Class.new(ActiveRecord::Base) do
        include ToModelHash
        self.table_name = "test_vms"
      end
    end

    let(:test_os_class) do
      Class.new(ActiveRecord::Base) do
        include ToModelHash
        self.table_name = "test_operating_systems"
      end
    end

    let(:fixed_options)       { test_vm_class.send(:to_model_hash_options_fixup, @test_to_model_hash_options) }
    let(:mocked_preloader)    { double }

    require 'active_support/testing/stream'
    include ActiveSupport::Testing::Stream

    before do
      silence_stream($stdout) do
        ActiveRecord::Schema.define do
          create_table :test_vms, :force => true do |t|
            t.string :name
          end

          create_table :test_hardwares, :force => true do |t|
            t.integer :bitness
            t.integer :test_vm_id
          end

          create_table :test_disks, :force => true do |t|
            t.integer :num_disks
            t.integer :something
            t.integer :test_hardware_id
          end

          create_table :test_operating_systems, :force => true do |t|
            t.string :name
          end
        end
      end

      test_disk_class.belongs_to     :test_hardware,         :anonymous_class => test_hardware_class, :inverse_of => :test_disks
      test_hardware_class.has_many   :test_disks,            :anonymous_class => test_disk_class,     :inverse_of => :test_hardware
      test_hardware_class.belongs_to :test_vm,               :anonymous_class => test_vm_class,       :inverse_of => :test_hardware
      test_vm_class.has_one          :test_hardware,         :anonymous_class => test_hardware_class, :inverse_of => :test_vm,       :dependent => :destroy
      test_vm_class.has_one          :test_operating_system, :anonymous_class => test_os_class,       :inverse_of => false,          :dependent => :destroy

      # we're testing the preload of associations, skip the recursive .to_model_hash
      allow_any_instance_of(ActiveRecord::Base).to receive(:to_model_hash_recursive)
      allow(ActiveRecord::Associations::Preloader).to receive(:new).and_return(mocked_preloader)
    end

    def assert_preloaded(associations)
      expect(mocked_preloader).to receive(:preload) do |_recs, assocs|
        expect(assocs).to match_array(associations)
      end

      test_vm_class.new.to_model_hash(fixed_options)
    end

    it "included column" 


    it "nested included columns" 


    it "columns included from different associations" 


    context "virtual columns" do
      it "virtual column on main table" 


      it "virtual column and included column" 


      it "virtual column matches included association column" 


      it "included association virtual column " 


      it "virtual and regular column included from different associations" 

    end
  end
end

