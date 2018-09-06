describe VirtualTotal do
  before do
    # rubocop:disable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs, Naming/AccessorMethodName
    class VitualTotalTestBase < ActiveRecord::Base
      self.abstract_class = true

      establish_connection :adapter => 'sqlite3', :database => ':memory:'

      include VirtualFields

      # HACK:  not sure the right way to do this
      def self.id_increment
        @id_increment ||= 0
        @id_increment  += 1
      end
    end

    ActiveRecord::Schema.define do
      def self.connection; VitualTotalTestBase.connection; end
      def self.set_pk_sequence!(*); end
      self.verbose = false

      create_table :vt_authors do |t|
        t.string   :name
      end

      create_table :vt_books do |t|
        t.integer  :author_id
        t.string   :name
        t.boolean  :published, :default => false
        t.boolean  :special,   :default => false
        t.integer  :rating
        t.datetime :created_on
      end
    end

    class VtAuthor < VitualTotalTestBase
      def self.connection; VitualTotalTestBase.connection; end

      has_many :books,                             :class_name => "VtBook", :foreign_key => "author_id"
      has_many :published_books, -> { published }, :class_name => "VtBook", :foreign_key => "author_id"
      has_many :wip_books,       -> { wip },       :class_name => "VtBook", :foreign_key => "author_id"

      virtual_total :total_books, :books
      virtual_total :total_books_published, :published_books
      virtual_total :total_books_in_progress, :wip_books

      def self.create_with_books(count = 0)
        create!(:name => "foo", :id => id_increment).tap { |author| author.create_books(count) }
      end

      def create_books(count, create_attrs = {})
        count.times do
          attrs = {
            :name   => "bar",
            :author => self,
            :id     => VtBook.id_increment
          }.merge(create_attrs)
          VtBook.create(attrs)
        end
      end
    end

    class VtBook < VitualTotalTestBase
      def self.connection; VitualTotalTestBase.connection end

      belongs_to :author, :class_name => "VtAuthor"
      scope :published, -> { where(:published => true)  }
      scope :wip,       -> { where(:published => false) }
    end
    # rubocop:enable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs, Naming/AccessorMethodName
  end

  after do
    VitualTotalTestBase.remove_connection
    Object.send(:remove_const, :VtAuthor)
    Object.send(:remove_const, :VtBook)
    Object.send(:remove_const, :VitualTotalTestBase)
  end

  describe ".virtual_total" do
    context "with a standard has_many" do
      it "sorts by total" 


      it "calculates totals locally" 


      it "can bring back totals in primary query" 

    end

    context "with a has_many that includes a scope" do
      it "sorts by total" 


      it "calculates totals locally" 


      it "can bring back totals in primary query" 

    end

    context "with order clauses in the relation" do
      before do
        # Monkey patching VtAuthor for these specs
        class VtAuthor < VitualTotalTestBase
          has_many :recently_published_books, -> { published.order(:created_on => :desc) },
                   :class_name => "VtBook", :foreign_key => "author_id"

          virtual_total :total_recently_published_books, :recently_published_books
          virtual_aggregate :sum_recently_published_books_rating, :recently_published_books, :sum, :rating
        end
      end

      it "sorts by total" 


      it "calculates totals locally" 


      it "can bring back totals in primary query" 

    end

    context "with a special books class" do
      before do
        class SpecialVtBook < VtBook
          default_scope { where(:special => true) }

          self.table_name = 'vt_books'
        end

        # Monkey patching VtAuthor for these specs
        class VtAuthor < VitualTotalTestBase
          has_many :special_books,
                   :class_name => "SpecialVtBook", :foreign_key => "author_id"
          has_many :published_special_books, -> { published },
                   :class_name => "SpecialVtBook", :foreign_key => "author_id"

          virtual_total :total_special_books, :special_books
          virtual_total :total_special_books_published, :published_special_books
        end
      end

      after do
        Object.send(:remove_const, :SpecialVtBook)
      end

      context "with a has_many that includes a scope" do
        it "sorts by total" 


        it "calculates totals locally" 


        it "can bring back totals in primary query" 

      end
    end
  end

  describe ".virtual_total (with real has_many relation ems#total_vms)" do
    let(:base_model) { ExtManagementSystem }
    it "sorts by total" 


    it "calculates totals locally" 


    it "can bring back totals in primary query" 


    def model_with_children(count)
      FactoryGirl.create(:ext_management_system).tap do |ems|
        FactoryGirl.create_list(:vm, count, :ext_management_system => ems) if count > 0
      end
    end
  end

  describe ".virtual_total (with virtual relation (resource_pool#total_vms)" do
    let(:base_model) { ResourcePool }
    # it can not sort by virtual

    it "calculates totals locally" 


    it "is not defined in sql" 


    def model_with_children(count)
      FactoryGirl.create(:resource_pool).tap do |pool|
        count.times do |_i|
          vm = FactoryGirl.create(:vm)
          vm.with_relationship_type("ems_metadata") { vm.set_parent pool }
        end
      end
    end
  end

  describe ".virtual_total (with through relation (ems#total_storages)" do
    let(:base_model) { ExtManagementSystem }

    it "calculates totals locally" 


    it "is not defined in sql" 


    def model_with_children(count)
      FactoryGirl.create(:ext_management_system).tap do |ems|
        ems.hosts.create(FactoryGirl.attributes_for(:host)).tap do |host|
          count.times { host.storages.create(FactoryGirl.attributes_for(:storage)) }
        end
      end.reload
    end
  end

  # Duplicated from VmOrTemplateSpec#provisioned_storage since this can't be
  # simulated in SQLite, since they allow you to have an ORDER BY with a column
  # that isn't in the SELECT clause...
  #
  # Keep this test here to confirm the virtual_aggregate works when an order
  # exists on the scope, unless this is aggregate is deleted (then feel free to
  # remove).
  describe ".virtual_total (with real has_many relation and .order() in scope vm#provisioned_storage)" do
    context "with no hardware" do
      let(:base_model) { Vm }

      it "calculates totals locally" 


      it "uses calculated (inline) attribute" 


      def model_with_children(count)
        FactoryGirl.create(:vm_vmware, :hardware => FactoryGirl.create(:hardware)).tap do |vm|
          count.times { vm.hardware.disks.create(:size => 10.0) }
        end.reload
      end
    end
  end
end

