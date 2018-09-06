describe UniqueWithinRegionValidator do
  describe "#unique_within_region" do
    context "class without STI" do
      let(:case_sensitive_class) do
        Class.new(User).tap do |c|
          c.class_eval do
            validates :name, :unique_within_region => true
          end
        end
      end

      let(:case_insensitive_class) do
        Class.new(User).tap do |c|
          c.class_eval do
            validates :name, :unique_within_region => {:match_case => false}
          end
        end
      end

      let(:test_name) { "thename" }

      let(:in_first_region_id) do
        FactoryGirl.create(
          :user,
          :id   => case_sensitive_class.id_in_region(1, 0),
          :name => test_name
        ).id
      end

      let(:also_in_first_region_id) do
        FactoryGirl.create(
          :user,
          :id   => case_sensitive_class.id_in_region(2, 0),
          :name => test_name.upcase
        ).id
      end

      let(:in_second_region_id) do
        FactoryGirl.create(
          :user,
          :id   => case_sensitive_class.id_in_region(2, 1),
          :name => test_name
        ).id
      end

      it "returns true if the field is unique for the records in the region" 


      it "returns false if the field is not unique for the records in the region" 


      it "is case insensitive if match_case is set to false" 

    end

    context "class with STI" do
      context "two subclasses" do
        it "raises error with non-unique names in same region" 


        it "doesn't raise error with unique names" 

      end
    end
  end
end

