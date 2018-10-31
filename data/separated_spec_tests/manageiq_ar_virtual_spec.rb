describe VirtualFields do
  context "TestClass" do
    before do
      class TestClassBase < ActiveRecord::Base
        self.abstract_class = true

        establish_connection :adapter => 'sqlite3', :database => ':memory:'

        include VirtualFields
      end

      ActiveRecord::Schema.define do
        def self.connection
          TestClassBase.connection
        end
        def self.set_pk_sequence!(*); end
        self.verbose = false

        create_table :test_classes do |t|
          t.integer :col1
        end

        create_table :test_other_classes do |t|
          t.integer :ocol1
          t.string  :ostr
        end
      end

      require 'ostruct'
      class TestClass < TestClassBase
        def self.connection
          TestClassBase.connection
        end
        belongs_to :ref1, :class_name => 'TestClass', :foreign_key => :col1
      end
    end

    after do
      TestClassBase.remove_connection
      Object.send(:remove_const, :TestClass)
      Object.send(:remove_const, :TestClassBase)
    end

    it "should not have any virtual columns" 


    context ".virtual_column" do
      it "with invalid parameters" 


      it "with symbol name" 


      it "with string name" 


      it "with string type" 


      it "with symbol type" 


      it "with string_set type" 


      it "with numeric_set type" 


      it "without uses" 


      it "with uses" 


      it "with arel" 

    end

    context ".virtual_columns=" do
      it "can have multiple virtual columns" 

    end

    context ".virtual_attribute_names" do
      it "has virtual attributes" 


      it "does not have aliases" 


      it "supports virtual_column aliases" 

    end

    shared_examples_for "TestClass with virtual columns" do
      context "TestClass" do
        it ".virtual_attribute_names" 


        it ".attribute_names" 


        context ".virtual_attribute?" do
          context "with virtual column" do
            it("as string") { expect(TestClass.virtual_attribute?("vcol1")).to be_truthy }
            it("as symbol") { expect(TestClass.virtual_attribute?(:vcol1)).to  be_truthy }
          end

          context "with column" do
            it("as string") { expect(TestClass.virtual_attribute?("col1")).not_to be_truthy }
            it("as symbol") { expect(TestClass.virtual_attribute?(:col1)).not_to  be_truthy }
          end

          context "with alias" do
            before { TestClass.alias_attribute :col2, :col1 }
            it("as string") { expect(TestClass.virtual_attribute?("col1")).not_to be_truthy }
            it("as symbol") { expect(TestClass.virtual_attribute?(:col1)).not_to  be_truthy }
          end
        end

        it ".remove_virtual_fields" 

      end
    end

    shared_examples_for "TestSubclass with virtual columns" do
      context "TestSubclass" do
        it ".virtual_attribute_names" 


        it ".attribute_names" 


        context ".virtual_attribute?" do
          context "with virtual column" do
            it("as string") { expect(test_sub_class.virtual_attribute?("vcolsub1")).to be_truthy }
            it("as symbol") { expect(test_sub_class.virtual_attribute?(:vcolsub1)).to  be_truthy }
          end

          context "with column" do
            it("as string") { expect(test_sub_class.virtual_attribute?("col1")).not_to be_truthy }
            it("as symbol") { expect(test_sub_class.virtual_attribute?(:col1)).not_to  be_truthy }
          end
        end

        it ".remove_virtual_fields" 

      end
    end

    context "with virtual columns" do
      before do
        TestClass.virtual_column :vcol1, :type => :string
        TestClass.virtual_column :vcol2, :type => :string

        @vcols_strs = ["vcol1", "vcol2"]
        @vcols_syms = [:vcol1, :vcol2]
        @cols_strs  = @vcols_strs + ["id", "col1"]
        @cols_syms  = @vcols_syms + [:id, :col1]
      end

      it_should_behave_like "TestClass with virtual columns"

      context "and TestSubclass with virtual columns" do
        let(:test_sub_class) do
          Class.new(TestClass) do
            virtual_column :vcolsub1, :type => :string
          end
        end
        before do
          test_sub_class
          @vcols_sub_strs = @vcols_strs + ["vcolsub1"]
          @vcols_sub_syms = @vcols_syms + [:vcolsub1]
          @cols_sub_strs  = @vcols_sub_strs + ["id", "col1"]
          @cols_sub_syms  = @vcols_sub_syms + [:id, :col1]
        end

        it_should_behave_like "TestClass with virtual columns" # Shows inheritance doesn't pollute base class
        it_should_behave_like "TestSubclass with virtual columns"
      end
    end

    it "should not have any virtual reflections" 


    context "add_virtual_reflection integration" do
      it "with invalid parameters" 


      it "with symbol name" 


      it("with has_one macro")    do
        TestClass.virtual_has_one(:vref1)
        expect(TestClass.virtual_reflection(:vref1).macro).to eq(:has_one)
      end

      it("with has_many macro")   do
        TestClass.virtual_has_many(:vref1)
        expect(TestClass.virtual_reflection(:vref1).macro).to eq(:has_many)
      end

      it("with belongs_to macro") do
        TestClass.virtual_belongs_to(:vref1)
        expect(TestClass.virtual_reflection(:vref1).macro).to eq(:belongs_to)
      end

      it "without uses" 


      it "with uses" 

    end

    describe "#virtual_has_many" do
      it "use collect for virtual_ids column" 


      it "use Relation#ids for virtual_ids column" 

    end

    %w(has_one has_many belongs_to).each do |macro|
      virtual_method = "virtual_#{macro}"

      context ".#{virtual_method}" do
        it "with symbol name" 


        it "without uses" 


        it "with uses" 

      end
    end

    context "virtual_reflection assignment" do
      it "" 


      it "with existing virtual reflections" 

    end

    shared_examples_for "TestClass with virtual reflections" do
      context "TestClass" do
        it ".virtual_reflections" 


        it ".reflections_with_virtual" 


        context ".virtual_reflection?" do
          context "with virtual reflection" do
            it("as string") { expect(TestClass.virtual_reflection?("vref1")).to be_truthy }
            it("as symbol") { expect(TestClass.virtual_reflection?(:vref1)).to  be_truthy }
          end

          context "with reflection" do
            it("as string") { expect(TestClass.virtual_reflection?("ref1")).not_to be_truthy }
            it("as symbol") { expect(TestClass.virtual_reflection?(:ref1)).not_to  be_truthy }
          end
        end

        it ".remove_virtual_fields" 

      end
    end

    shared_examples_for "TestSubclass with virtual reflections" do
      context "TestSubclass" do
        it ".virtual_reflections" 


        it ".reflections_with_virtual" 


        context ".virtual_reflection?" do
          context "with virtual reflection" do
            it("as string") { expect(TestClass.virtual_reflection?("vref1")).to be_truthy }
            it("as symbol") { expect(TestClass.virtual_reflection?(:vref1)).to  be_truthy }
          end

          context "with reflection" do
            it("as string") { expect(TestClass.virtual_reflection?("ref1")).not_to be_truthy }
            it("as symbol") { expect(TestClass.virtual_reflection?(:ref1)).not_to  be_truthy }
          end
        end

        it ".remove_virtual_fields" 

      end
    end

    context "with virtual reflections" do
      before do
        TestClass.virtual_has_one :vref1
        TestClass.virtual_has_one :vref2

        @vrefs_syms = [:vref1, :vref2]
        @refs_syms  = @vrefs_syms + [:ref1]
      end

      it_should_behave_like "TestClass with virtual reflections"

      context "and TestSubclass with virtual reflections" do
        let(:test_sub_class) do
          Class.new(TestClass) do
            def self.reflections; super.merge(:ref2 => OpenStruct.new(:name => :ref2, :options => {}, :klass => TestClass)); end

            virtual_has_one :vrefsub1
          end
        end
        before do
          test_sub_class
          @vrefs_sub_syms = @vrefs_syms + [:vrefsub1]
          @refs_sub_syms  = @vrefs_sub_syms + [:ref1, :ref2]
        end

        it_should_behave_like "TestClass with virtual reflections" # Shows inheritance doesn't pollute base class
        it_should_behave_like "TestSubclass with virtual reflections"
      end
    end

    context "with both virtual columns and reflections" do
      before do
        TestClass.virtual_column  :vcol1, :type => :string
        TestClass.virtual_has_one :vref1
      end

      context ".virtual_field?" do
        context "with virtual reflection" do
          it("as string") { expect(TestClass.virtual_reflection?("vref1")).to be_truthy }
          it("as symbol") { expect(TestClass.virtual_reflection?(:vref1)).to  be_truthy }
        end

        context "with reflection" do
          it("as string") { expect(TestClass.virtual_reflection?("ref1")).not_to be_truthy }
          it("as symbol") { expect(TestClass.virtual_reflection?(:ref1)).not_to  be_truthy }
        end

        context "with virtual column" do
          it("as string") { expect(TestClass.virtual_attribute?("vcol1")).to be_truthy }
          it("as symbol") { expect(TestClass.virtual_attribute?(:vcol1)).to  be_truthy }
        end

        context "with column" do
          it("as string") { expect(TestClass.virtual_attribute?("col1")).not_to be_truthy }
          it("as symbol") { expect(TestClass.virtual_attribute?(:col1)).not_to  be_truthy }
        end
      end
    end

    describe ".attribute_supported_by_sql?" do
      it "supports real columns" 


      it "supports aliases" 


      it "does not support virtual columns" 


      it "supports virtual columns with arel" 


      it "supports delegates" 


      it "does not support bogus columns" 


      it "supports on an aaar class" 

    end

    describe ".virtual_delegate" do
      # double purposing col1. It has an actual value in the child class
      let(:parent) { TestClass.create(:id => 1, :col1 => 4) }

      it "delegates to parent" 


      it "delegates to nil parent" 


      it "defines parent virtual attribute" 


      it "delegates to parent (sql)" 


      context "with has_one :parent" do
        before do
          TestClass.has_one :ref2, :class_name => 'TestClass', :foreign_key => :col1, :inverse_of => :ref1
        end
        # child.col1 will be getting parent's (aka tc's) id
        let(:child) { TestClass.create(:id => 1) }

        it "delegates to child" 


        it "delegates to nil child" 


        it "defines child virtual attribute" 


        it "delegates to child (sql)" 


        # this may fail in the future as our way of building queries may change
        # just want to make sure it changed due to intentional changes
        it "uses table alias for subquery" 

      end

      context "with relation in foreign table" do
        before do
          class TestOtherClass < ActiveRecord::Base
            def self.connection
              TestClassBase.connection
            end
            belongs_to :oref1, :class_name => 'TestClass', :foreign_key => :ocol1

            include VirtualFields
          end
        end

        after do
          TestOtherClass.remove_connection
          Object.send(:remove_const, :TestOtherClass)
        end

        it "delegates to another table" 


        # this may fail in the future as our way of building queries may change
        # just want to make sure it changed due to intentional changes
        it "delegates to another table without alias" 

      end
    end

    describe ".attribute_supported_by_sql?" do
      it "supports real columns" 


      it "supports aliases" 


      it "does not support virtual columns" 


      it "supports virtual columns with arel" 


      it "supports delegates" 

    end

    describe ".arel_attribute" do
      it "supports aliases" 


      # NOTE: should not need to add a virtual attribute to an alias
      # TODO: change code for reports and automate to expose aliases like it does with attributes/virtual attributes.
      it "supports aliases marked as a virtual_attribute" 

    end

    describe "#select" do
      it "supports virtual attributes" 


      it "supports virtual attributes with as" 


      it "supports #includes with #references" 

    end

    describe ".virtual_delegate" do
      # double purposing col1. It has an actual value in the child class
      let(:parent) { TestClass.create(:id => 1, :col1 => 4) }

      it "delegates to child" 


      it "delegates to nil child" 


      it "defines virtual attribute" 


      it "defines with a new name" 


      it "defaults for to nil child (array)" 


      it "defaults for to nil child (integer)" 


      it "defaults for to nil child (string)" 

    end

    describe "#sum" do
      it "supports virtual attributes" 

    end
  end

  describe "#follow_associations" do
    it "returns base class" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    it "follows reflections" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    # Vms.virtual_has_many :processes
    it "stops at virtual reflections" 

  end

  describe "#follow_associations_with_virtual" do
    it "returns base class" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    it "follows reflections" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    # Vms.virtual_has_many :processes
    it "follows virtual reflections" 

  end

  describe "collect_reflections" do
    it "returns base class" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    it "follows reflections" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    # Vms.virtual_has_many :processes
    it "stops at virtual reflections" 

  end

  describe "collect_reflections_with_virtual" do
    it "returns base class" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    it "follows reflections" 


    # Ems.has_many :vms
    # Vms.belongs_to :host
    # Vms.virtual_has_many :processes
    it "stops at virtual reflections" 

  end

  context "preloading" do
    before do
      FactoryGirl.create(:vm_vmware,
                         :hardware         => FactoryGirl.create(:hardware),
                         :operating_system => FactoryGirl.create(:operating_system),
                         :host             => FactoryGirl.create(:host,
                                                                 :hardware         => FactoryGirl.create(:hardware),
                                                                 :operating_system => FactoryGirl.create(:operating_system)
                                                                )
                        )
    end

    context "virtual column" do
      it "as Symbol" 


      it "as Array" 


      it "as Hash" 

    end

    context "virtual reflection" do
      it "as Symbol" 


      it "as Array" 


      it "as Hash" 

    end

    it "nested virtual fields" 


    it "virtual field that has nested virtual fields in its :uses clause" 


    it "should handle virtual fields in :include when :conditions are also present in calculations" 

  end
end

describe "ApplicationRecord class" do
  describe ".virtual_attribute_names" do
    it "class immediately under ApplicationRecord" 


    it "class not immediately under ApplicationRecord" 

  end

  describe ".attribute_names" do
    it "class immediately under ApplicationRecord" 


    it "class not immediately under ApplicationRecord" 

  end
end

