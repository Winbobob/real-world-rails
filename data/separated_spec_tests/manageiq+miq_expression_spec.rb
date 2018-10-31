describe MiqExpression do
  describe '#reporting_available_fields' do
    let(:vm) { FactoryGirl.create(:vm) }
    let!(:custom_attribute) { FactoryGirl.create(:custom_attribute, :name => 'my_attribute_1', :resource => vm) }
    let(:extra_fields) do
      %w(start_date
         end_date
         interval_name
         display_range
         entity
         tag_name
         label_name
         id
         vm_id
         vm_name)
    end

    it 'lists custom attributes in ChargebackVm' 


    context 'with ChargebackVm' do
      context 'with dynamic fields' do
        let(:volume_1) { FactoryGirl.create(:cloud_volume, :volume_type => 'TYPE1') }
        let(:volume_2) { FactoryGirl.create(:cloud_volume, :volume_type => 'TYPE2') }
        let(:volume_3) { FactoryGirl.create(:cloud_volume, :volume_type => 'TYPE3') }
        let(:model)    { "ChargebackVm" }
        let(:volume_1_type_field_cost) { "#{model}-storage_allocated_#{volume_1.volume_type}_cost" }
        let(:volume_2_type_field_cost) { "#{model}-storage_allocated_#{volume_2.volume_type}_cost" }
        let(:volume_3_type_field_cost) { "#{model}-storage_allocated_#{volume_3.volume_type}_cost" }

        before do
          volume_1
          volume_2
        end

        it 'returns uncached actual fields also when dynamic fields chas been changed' 

      end
    end
  end

  describe "#valid?" do
    it "returns true for a valid flat expression" 


    it "returns false for an invalid flat expression" 


    it "returns true if all the subexressions in an 'AND' expression are valid" 


    it "returns false if one of the subexressions in an 'AND' expression is invalid" 


    it "returns true if all the subexressions in an 'OR' expression are valid" 


    it "returns false if one of the subexressions in an 'OR' expression is invalid" 


    it "returns true if the subexression in a 'NOT' expression is valid" 


    it "returns false if the subexression in a 'NOT' expression is invalid" 


    it "returns true if the subexpressions in a 'FIND'/'checkall' expression are all valid" 


    it "returns false if a subexpression in a 'FIND'/'checkall' expression is invalid" 


    it "returns true if the subexpressions in a 'FIND'/'checkany' expression are all valid" 


    it "returns false if a subexpression in a 'FIND'/'checkany' expression is invalid" 


    it "returns true if the subexpressions in a 'FIND'/'checkcount' expression are all valid" 


    it "returns false if a subexpression in a 'FIND'/'checkcount' expression is invalid" 

  end

  describe "#to_sql" do
    it "generates the SQL for an EQUAL expression" 


    it "generates the SQL for an EQUAL expression with an association" 


    it "generates the SQL for a = expression" 


    it "generates the SQL for a = expression with expression as a value" 


    it "will handle values that look like they contain MiqExpression-encoded constants but cannot be loaded" 


    it "generates the SQL for a < expression" 


    it "generates the SQL for a < expression with expression as a value" 


    it "generates the SQL for a <= expression" 


    it "generates the SQL for a <= expression with expression as a value" 


    it "generates the SQL for a > expression" 


    it "generates the SQL for a > expression with expression as a value" 


    it "generates the SQL for a >= expression" 


    it "generates the SQL for a >= expression with expression as a value" 


    it "generates the SQL for a != expression" 


    it "generates the SQL for a != expression with expression as a value" 


    it "generates the SQL for a LIKE expression" 


    it "generates the SQL for a NOT LIKE expression" 


    it "generates the SQL for a STARTS WITH expression " 


    it "generates the SQL for an ENDS WITH expression" 


    it "generates the SQL for an INCLUDES" 


    it "generates the SQL for an INCLUDES ANY with expression method" 


    it "does not generate SQL for an INCLUDES ANY without an expression method" 


    it "does not generate SQL for an INCLUDES ALL without an expression method" 


    it "does not generate SQL for an INCLUDES ONLY without an expression method" 


    it "generates the SQL for an AND expression" 


    it "generates the SQL for an AND expression where only one is supported by SQL" 


    it "returns nil for an AND expression where none is supported by SQL" 


    it "generates the SQL for an OR expression" 


    it "returns nil for an OR expression where one is not supported by SQL" 


    it "returns nil for an OR expression where none is supported by SQL" 


    it "properly groups the items in an AND/OR expression" 


    it "generates the SQL for a NOT expression" 


    it "generates the SQL for a ! expression" 


    it "generates the SQL for an IS NULL expression" 


    it "generates the SQL for an IS NOT NULL expression" 


    it "generates the SQL for an IS EMPTY expression" 


    it "generates the SQL for an IS NOT EMPTY expression" 


    it "generates the SQL for a CONTAINS expression with field" 


    it "cant generates the SQL for a CONTAINS expression with association.association-field" 


    it "cant generat the SQL for a CONTAINS expression virtualassociation" 


    it "cant generat the SQL for a CONTAINS expression with [association.virtualassociation]" 


    it "generates the SQL for a CONTAINS expression with field containing a scope" 


    it "generates the SQL for a CONTAINS expression with tag" 


    it "returns nil for a Registry expression" 


    it "raises an error for an expression with unknown operator" 


    it "should test virtual column FB15509" 


    context "date/time support" do
      it "generates the SQL for a = expression with a date field" 


      it "generates the SQL for an AFTER expression" 


      it "generates the SQL for a BEFORE expression" 


      it "generates the SQL for an AFTER expression with date/time" 


      it "generates the SQL for a != expression with a date field" 


      it "generates the SQL for an IS expression" 


      it "generates the SQL for a FROM expression" 


      it "generates the SQL for a FROM expression with MM/DD/YYYY dates" 


      it "generates the SQL for a FROM expression with date/time" 


      it "generates the SQL for a FROM expression with two identical datetimes" 

    end

    context "relative date/time support" do
      around { |example| Timecop.freeze("2011-01-11 17:30 UTC") { example.run } }

      context "given a non-UTC timezone" do
        it "generates the SQL for a AFTER expression with a value of 'Yesterday' for a date field" 


        it "generates the SQL for a BEFORE expression with a value of 'Yesterday' for a date field" 


        it "generates the SQL for an IS expression with a value of 'Yesterday' for a date field" 


        it "generates the SQL for a FROM expression with a value of 'Yesterday'/'Today' for a date field" 

      end

      it "generates the SQL for an AFTER expression with an 'n Days Ago' value for a date field" 


      it "generates the SQL for an AFTER expression with an 'n Days Ago' value for a datetime field" 


      it "generates the SQL for a BEFORE expression with an 'n Days Ago' value for a date field" 


      it "generates the SQL for a BEFORE expression with an 'n Days Ago' value for a datetime field" 


      it "generates the SQL for a FROM expression with a 'Last Hour'/'This Hour' value for a datetime field" 


      it "generates the SQL for a FROM expression with a 'Last Week'/'Last Week' value for a date field" 


      it "generates the SQL for a FROM expression with a 'Last Week'/'Last Week' value for a datetime field" 


      it "generates the SQL for a FROM expression with an 'n Months Ago'/'Last Month' value for a datetime field" 


      it "generates the SQL for an IS expression with a 'Today' value for a date field" 


      it "generates the SQL for an IS expression with an 'n Hours Ago' value for a date field" 


      it "generates the SQL for an IS expression with an 'n Hours Ago' value for a datetime field" 

    end

    describe "integration" do
      context "date/time support" do
        it "finds the correct instances for an gt expression with a dynamic integer field" 


        it "finds the correct instances for an gt expression with a custom attribute dynamic integer field" 


        it "finds the correct instances for an AFTER expression with a datetime field" 


        it "finds the correct instances for an IS EMPTY expression with a datetime field" 


        it "finds the correct instances for an IS EMPTY expression with a date field" 


        it "finds the correct instances for an IS NOT EMPTY expression with a datetime field" 


        it "finds the correct instances for an IS NOT EMPTY expression with a date field" 


        it "finds the correct instances for an IS expression with a date field" 


        it "finds the correct instances for an IS expression with a datetime field" 


        it "finds the correct instances for a FROM expression with a datetime field, given date values" 


        it "finds the correct instances for a FROM expression with a date field" 


        it "finds the correct instances for a FROM expression with a datetime field, given datetimes" 

      end

      context "relative date/time support" do
        around { |example| Timecop.freeze("2011-01-11 17:30 UTC") { example.run } }

        it "finds the correct instances for an IS expression with 'Today'" 


        it "finds the correct instances for an IS expression with a datetime field and 'n Hours Ago'" 


        it "finds the correct instances for an IS expression with 'Last Month'" 


        it "finds the correct instances for a FROM expression with a date field and 'Last Week'" 


        it "finds the correct instances for a FROM expression with a datetime field and 'Last Week'" 


        it "finds the correct instances for a FROM expression with 'Last Week' and 'This Week'" 


        it "finds the correct instances for a FROM expression with 'n Months Ago'" 


        it "finds the correct instances for a FROM expression with 'Last Month'" 

      end

      context "timezone support" do
        it "finds the correct instances for a FROM expression with a datetime field and timezone" 


        it "finds the correct instances for a FROM expression with a date field and timezone" 


        it "finds the correct instances for an IS expression with timezone" 

      end
    end
  end

  describe "#lenient_evaluate" do
    describe "integration" do
      it "with a find/checkany expression" 


      it "with a find/checkall expression" 


      it "cannot execute non-attribute methods on target objects" 

    end
  end

  describe "#to_ruby" do
    it "generates the ruby for a = expression with count" 


    it "generates the ruby for a = expression with regkey" 


    it "generates the ruby for a < expression with hash context" 


    it "generates the ruby for a < expression with count" 


    it "generates the ruby for a > expression with hash context" 


    it "generates the ruby for a > expression with count" 


    it "generates the ruby for a >= expression with hash context" 


    it "generates the ruby for a >= expression with count" 


    it "generates the ruby for a <= expression with hash context" 


    it "generates the ruby for a <= expression with count" 


    it "generates the ruby for a !=  expression with hash context" 


    it "generates the ruby for a != expression with count" 


    it "generates the ruby for a BEFORE expression with hash context" 


    it "generates the ruby for a AFTER expression with hash context" 


    it "generates the ruby for a INCLUDES ALL expression with hash context" 


    it "generates the ruby for a INCLUDES ANY expression with hash context" 


    it "generates the ruby for a INCLUDES ONLY expression with hash context" 


    it "generates the ruby for a LIMITED TO expression with hash context" 


    it "generates the ruby for a LIKE expression with field" 


    it "generates the ruby for a LIKE expression with hash context" 


    it "generates the ruby for a LIKE  expression with regkey" 


    it "generates the ruby for a NOT LIKE expression with field" 


    it "generates the ruby for a NOT LIKE expression with hash context" 


    it "generates the ruby for a NOT LIKE expression with regkey" 


    it "generates the ruby for a STARTS WITH expression with hash context with field" 


    it "generates the ruby for a STARTS WITH expression with regkey" 


    it "generates the ruby for a ENDS WITH expression with hash context" 


    it "generates the ruby for a ENDS WITH expression with regkey" 


    it "generates the ruby for a INCLUDES expression with hash context" 


    it "generates the ruby for a INCLUDES expression with regkey" 


    it "generates the ruby for a REGULAR EXPRESSION MATCHES expression with regkey" 


    it "generates the ruby for a REGULAR EXPRESSION DOES NOT MATCH expression with hash context" 


    it "generates the ruby for a REGULAR EXPRESSION DOES NOT MATCH expression with regkey" 


    it "generates the ruby for a IS NULL expression with hash context" 


    it "generates the ruby for a IS NULL expression with regkey" 


    it "generates the ruby for a IS NOT NULL expression with hash context" 


    it "generates the ruby for a IS NOT NULL expression with regkey" 


    it "generates the ruby for a IS EMPTY expression with hash context" 


    it "generates the ruby for a IS EMPTY expression with regkey" 


    it "generates the ruby for a IS NOT EMPTY expression with hash context" 


    it "generates the ruby for a IS NOT EMPTY expression with regkey" 


    it "generates the ruby for a CONTAINS expression with hash context" 


    it "generates the SQL for a < expression" 


    it "generates the SQL for a < expression with dynamic value" 


    it "generates the SQL for a <= expression" 


    it "generates the SQL for a <= expression with dynamic value" 


    it "generates the SQL for a != expression" 


    it "generates the SQL for a != expression with dynamic value" 


    it "detects value empty array" 


    it "raises error if expression contains ruby script" 


    it "tests numeric set expressions" 


    it "escapes forward slashes for values in REGULAR EXPRESSION MATCHES expressions" 


    it "preserves the delimiters when escaping forward slashes in case-insensitive REGULAR EXPRESSION MATCHES expressions" 


    it "escapes forward slashes for non-Regexp literal values in REGULAR EXPRESSION MATCHES expressions" 


    it "does not escape escaped forward slashes for values in REGULAR EXPRESSION MATCHES expressions" 


    it "handles arbitarily long escaping of forward " 


    it "escapes interpolation in REGULAR EXPRESSION MATCHES expressions" 


    it "handles arbitrarily long escaping of interpolation in REGULAR EXPRESSION MATCHES expressions" 


    it "escapes interpolation in non-Regexp literal values in REGULAR EXPRESSION MATCHES expressions" 


    it "escapes forward slashes for values in REGULAR EXPRESSION DOES NOT MATCH expressions" 


    it "preserves the delimiters when escaping forward slashes in case-insensitive REGULAR EXPRESSION DOES NOT MATCH expressions" 


    it "escapes forward slashes for non-Regexp literal values in REGULAR EXPRESSION DOES NOT MATCH expressions" 


    it "does not escape escaped forward slashes for values in REGULAR EXPRESSION DOES NOT MATCH expressions" 


    # Note: To debug these tests, the following may be helpful:
    # puts "Expression Raw:      #{filter.exp.inspect}"
    # puts "Expression in Human: #{filter.to_human}"
    # puts "Expression in Ruby:  #{filter.to_ruby}"

    it "expands ranges with INCLUDES ALL" 


    it "expands ranges with INCLUDES ANY" 


    it "expands ranges with INCLUDES ONLY" 


    it "expands ranges with LIMITED TO" 


    it "should test string set expressions with EQUAL" 


    it "should test string set expressions with INCLUDES ALL" 


    it "should test string set expressions with INCLUDES ANY" 


    it "should test string set expressions with INCLUDES ONLY" 


    it "should test string set expressions with LIMITED TO" 


    it "should test string set expressions with FIND/checkall" 


    it "should test regexp with regex literal" 


    it "should test regexp with string literal" 


    it "should test regexp as part of a FIND/checkany expression" 


    it "should test negative regexp with FIND/checkany expression" 


    it "should test fb7726" 


    it "should test numbers with methods" 


    it "should test numbers with commas with methods" 


    context "integration" do
      it "should escape strings" 


      context "when context_type is 'hash'" do
        let(:data) do
          {
            "name"                            => "VM_1",
            "guest_applications.version"      => "3.1.2.7193",
            "guest_applications.release"      => nil,
            "guest_applications.vendor"       => "VMware, Inc.", "id" => 9,
            "guest_applications.name"         => "VMware Tools",
            "guest_applications.package_name" => nil
          }
        end

        it "should test context hash with EQUAL" 


        it "should test context hash with REGULAR EXPRESSION MATCHES" 

      end
    end

    it "generates the ruby for a STARTS WITH expression" 


    it "generates the ruby for an ENDS WITH expression" 


    it "generates the ruby for an AND expression" 


    it "generates the ruby for an OR expression" 


    it "generates the ruby for a NOT expression" 


    it "generates the ruby for a ! expression" 


    it "generates the ruby for an IS NULL expression" 


    it "generates the ruby for an IS NOT NULL expression" 


    it "generates the ruby for an IS EMPTY expression" 


    it "generates the ruby for an IS NOT EMPTY expression" 


    it "generates the ruby for a FIND expression with checkall" 


    it "generates the ruby for a FIND expression with checkany" 


    it "generates the ruby for a FIND expression with checkcount and =" 


    it "generates the ruby for a FIND expression with checkcount and !=" 


    it "generates the ruby for a FIND expression with checkcount and <" 


    it "generates the ruby for a FIND expression with checkcount and >" 


    it "generates the ruby for a FIND expression with checkcount and <=" 


    it "generates the ruby for a FIND expression with checkcount and >=" 


    it "generates the ruby for a KEY EXISTS expression" 


    it "generates the ruby for a VALUE EXISTS expression" 


    it "raises an error for an expression with an invalid operator" 


    context "date/time support" do
      context "static dates and times with no timezone" do
        it "generates the ruby for an AFTER expression with date value" 


        it "generates the ruby for a BEFORE expression with date value" 


        it "generates the ruby for a AFTER expression with datetime value" 


        it "generates the ruby for a IS expression with date value" 


        it "generates the ruby for a IS expression with datetime value" 


        it "generates the ruby for a IS expression with hash context" 


        it "generates the ruby for a FROM expression with date values" 


        it "generates the ruby for a FROM expression with date values" 


        it "generates the ruby for a FROM expression with datetime values" 


        it "generates the ruby for a FROM expression with identical datetime values" 


        it "generates the ruby for a FROM expression with hash context" 

      end

      context "static dates and times with a time zone" do
        let(:tz) { "Eastern Time (US & Canada)" }

        it "generates the ruby for a AFTER expression with date value" 


        it "generates the ruby for a BEFORE expression with date value" 


        it "generates the ruby for a AFTER expression with datetime value" 


        it "generates the ruby for a AFTER expression with datetime value" 


        it "generates the ruby for a IS expression wtih date value" 


        it "generates the ruby for a FROM expression with date values" 


        it "generates the ruby for a FROM expression with datetime values" 


        it "generates the ruby for a FROM expression with identical datetime values" 

      end
    end

    context "relative date/time support" do
      around { |example| Timecop.freeze("2011-01-11 17:30 UTC") { example.run } }

      context "given a non-UTC timezone" do
        it "generates the SQL for a AFTER expression with a value of 'Yesterday' for a date field" 


        it "generates the RUBY for a BEFORE expression with a value of 'Yesterday' for a date field" 


        it "generates the RUBY for an IS expression with a value of 'Yesterday' for a date field" 


        it "generates the RUBY for a FROM expression with a value of 'Yesterday'/'Today' for a date field" 

      end

      context "relative dates with no time zone" do
        it "generates the ruby for an AFTER expression with date value of n Days Ago" 


        it "generates the ruby for an AFTER expression with datetime value of n Days ago" 


        it "generates the ruby for a BEFORE expression with date value of n Days Ago" 


        it "generates the ruby for a BEFORE expression with datetime value of n Days Ago" 


        it "generates the ruby for a FROM expression with datetime values of Last/This Hour" 


        it "generates the ruby for a FROM expression with date values of Last Week" 


        it "generates the ruby for a FROM expression with datetime values of Last Week" 


        it "generates the ruby for a FROM expression with datetime values of n Months Ago/Last Month" 


        it "generates the ruby for an IS expression with datetime value of Last Week" 


        it "generates the ruby for an IS expression with relative date with hash context" 


        it "generates the ruby for an IS expression with date value of Last Week" 


        it "generates the ruby for a IS expression with date value of Today" 


        it "generates the ruby for an IS expression with date value of n Hours Ago" 


        it "generates the ruby for a IS expression with datetime value of n Hours Ago" 

      end

      context "relative time with a time zone" do
        let(:tz) { "Hawaii" }

        it "generates the ruby for a FROM expression with datetime value of Last/This Hour" 


        it "generates the ruby for a FROM expression with date values of Last Week" 


        it "generates the ruby for a FROM expression with datetime values of Last Week" 


        it "generates the ruby for a FROM expression with datetime values of n Months Ago/Last Month" 


        it "generates the ruby for an IS expression with datetime value of Last Week" 


        it "generates the ruby for an IS expression with date value of Last Week" 


        it "generates the ruby for an IS expression with date value of Today" 


        it "generates the ruby for an IS expression with date value of n Hours Ago" 


        it "generates the ruby for an IS expression with datetime value of n Hours Ago" 

      end
    end
  end

  context 'value2tag' do
    it 'dotted notation with Taq' 


    it 'dotted notation with CountField' 


    it 'dotted notation with CountField' 


    it "dotted notation with value" 


    it "value with escaped slash" 


    it "user_tag" 


    it "model and column" 


    it "managed" 


    it "managed" 


    it "false value" 

  end

  describe ".numeric?" do
    it "should return true if digits separated by comma and false if another separator used" 


    it "should return true if there is method attached to number" 

  end

  describe ".integer?" do
    it "should return true if digits separated by comma and false if another separator used" 


    it "should return true if there is method attached to number" 

  end

  describe ".atom_error" do
    it "should return false if value can be evaluated as regular expression" 


    it "should return true if operator is 'ruby'" 


    it "should return false if data type of field is 'string' or 'text'" 


    it "should return false if field is 'count'" 


    it "should return false if data type of field is boolean and value is 'true' or 'false'" 


    it "should return false if data type of field is float and value evaluated to float" 


    it "should return false if data type of field is integer and value evaluated to integer" 


    it "should return false if data type of field is datetime and value evaluated to datetime" 


    it "should return false if most resent date is second element in array" 

  end

  context "._model_details" do
    it "should not be overly aggressive in filtering out columns for logical CPUs" 


    it "should not contain duplicate tag fields" 

  end

  context "._custom_details_for" do
    let(:klass)         { Vm }
    let(:vm)            { FactoryGirl.create(:vm) }
    let!(:custom_attr1) { FactoryGirl.create(:custom_attribute, :resource => vm, :name => "CATTR_1", :value => "Value 1") }
    let!(:custom_attr2) { FactoryGirl.create(:custom_attribute, :resource => vm, :name => nil,       :value => "Value 2") }

    it "ignores custom_attibutes with a nil name" 


    let(:conatiner_image) { FactoryGirl.create(:container_image) }

    let!(:custom_attribute_with_section_1) do
      FactoryGirl.create(:custom_attribute, :resource => conatiner_image, :name => 'CATTR_3', :value => "Value 3",
                         :section => 'section_3')
    end

    let!(:custom_attribute_with_section_2) do
      FactoryGirl.create(:custom_attribute, :resource => conatiner_image, :name => 'CATTR_3', :value => "Value 3",
                         :section => 'docker_labels')
    end

    it "returns human names of custom attributes with sections" 

  end

  describe "#to_human" do
    it "generates a human readable string for a 'FIELD' expression" 


    it "generates a human readable string for a FIELD expression with alias" 


    it "generates a human readable string for a FIND/CHECK expression" 


    it "generates a human readable string for a FIND/CHECK expression with alias" 


    it "generates a human readable string for a COUNT expression" 


    it "generates a human readable string for a COUNT expression with alias" 


    context "TAG type expression" do
      before do
        # tags contain the root tenant's name
        Tenant.seed

        category = FactoryGirl.create(:classification, :name => 'environment', :description => 'Environment')
        FactoryGirl.create(:classification, :parent_id => category.id, :name => 'prod', :description => 'Production')
      end

      it "generates a human readable string for a TAG expression" 


      it "generates a human readable string for a TAG expression with alias" 

    end

    context "when given values with relative dates" do
      it "generates a human readable string for a AFTER '2 Days Ago' expression" 


      it "generates a human readable string for a BEFORE '2 Days ago' expression" 


      it "generates a human readable string for a FROM 'Last Hour' THROUGH 'This Hour' expression" 


      it "generates a human readable string for a FROM 'Last Week' THROUGH 'Last Week' expression" 


      it "generates a human readable string for a FROM '2 Months ago' THROUGH 'Last Month' expression" 


      it "generates a human readable string for a IS '3 Hours Ago' expression" 

    end

    context "when giving value with static dates and times" do
      it "generates a human readable string for a AFTER expression with date without time" 


      it "generates a human readable string for a AFTER expression with date and time" 


      it "generates a human readable string for a BEFORE expression with date without time" 


      it "generates a human readable string for a '>' expression with date without time" 


      it "generates a human readable string for a '>' expression with date and time" 


      it "generates a human readable string for a '<' expression with date without time" 


      it "generates a human readable string for a '>=' expression with date and time" 


      it "generates a human readable string for a '<=' expression with date without time" 


      it "generates a human readable string for a 'IS' with date without time" 


      it "generates a human readable string for a FROM THROUGH expression with date format: 'yyyy-mm-dd'" 


      it "generates a human readable string for a FROM THROUGH expression with date format: 'mm/dd/yyyy'" 


      it "generates a human readable string for a FROM THROUGH expression with date and time" 

    end
  end

  context "quick search" do
    let(:exp) { {"=" => {"field" => "Vm-name", "value" => "test"}} }
    let(:qs_exp) { {"=" => {"field" => "Vm-name", "value" => :user_input}} }
    let(:complex_qs_exp) do
      {
        "AND" => [
          {"=" => {"field" => "Vm-name", "value" => "test"}},
          {"=" => {"field" => "Vm-name", "value" => :user_input}}
        ]
      }
    end

    describe ".quick_search?" do
      it "detects false in hash" 


      it "detects in hash" 


      it "detects in complex hash" 


      it "detects false in miq expression" 


      it "detects in miq expression" 

    end

    describe "#quick_search?" do
      it "detects false in hash" 


      it "detects in hash" 


      it "detects in complex hash" 

    end
  end

  describe ".merge_where_clauses" do
    it "returns nil for nil" 


    it "returns nil for blank" 


    it "returns nil for multiple empty arrays" 


    it "returns same string single results" 


    it "returns same string when concatinating blank results" 


    # would be nice if we returned a hash
    it "returns a string if the only argument is a hash" 


    it "concatinates 2 arrays" 


    it "concatinates 2 string" 


    it "concatinates a string and a hash" 

  end

  describe ".get_col_type" do
    subject { described_class.get_col_type(@field) }
    let(:string_custom_attribute) do
      FactoryGirl.create(:custom_attribute,
                         :name          => "foo",
                         :value         => "string",
                         :resource_type => 'ExtManagementSystem')
    end
    let(:date_custom_attribute) do
      FactoryGirl.create(:custom_attribute,
                         :name          => "foo",
                         :value         => DateTime.current,
                         :resource_type => 'ExtManagementSystem')
    end

    it "with model-field__with_pivot_table_suffix" 


    it "with custom attribute without value_type" 


    it "with custom attribute with value_type" 


    it "with model.managed-in_field" 


    it "with model.last.managed-in_field" 


    it "with valid model-in_field" 


    it "with invalid model-in_field" 


    it "with valid model.association-in_field" 


    it "with invalid model.association-in_field" 


    it "with model-invalid_field" 


    it "with field without model" 

  end

  describe ".model_details" do
    before do
      # tags contain the root tenant's name
      Tenant.seed

      cat = FactoryGirl.create(:classification,
                               :description  => "Auto Approve - Max CPU",
                               :name         => "prov_max_cpu",
                               :single_value => true,
                               :show         => true,
                               :parent_id    => 0
                              )
      cat.add_entry(:description  => "1",
                    :read_only    => "0",
                    :syntax       => "string",
                    :name         => "1",
                    :example_text => nil,
                    :default      => true,
                    :single_value => "1"
                   )
    end

    context "with :typ=>tag" do
      it "VmInfra" 


      it "VmCloud" 


      it "VmOrTemplate" 


      it "TemplateInfra" 


      it "TemplateCloud" 


      it "MiqTemplate" 


      it "EmsInfra" 


      it "EmsCloud" 

    end

    context "with :typ=>all" do
      it "VmOrTemplate" 


      it "Service" 


      it "Supports classes derived form ActsAsArModel" 

    end

    context "with :include_id_columns" do
      it "Vm" 

    end
  end

  context ".build_relats" do
    it "AvailabilityZone" 


    it "VmInfra" 


    it "Vm" 


    it "OrchestrationStack" 

  end

  describe ".determine_relat_path (private)" do
    subject { described_class.send(:determine_relat_path, @ref) }

    it "when association name is same as class name" 


    it "when association name is different from class name" 


    context "when class name is a subclass of association name" do
      it "one_to_one relation" 


      it "one_to_many relation" 

    end
  end

  describe ".get_col_operators" do
    subject { described_class.get_col_operators(@field) }

    it "returns array of available operations if parameter is :count" 


    it "returns list of available operations if parameter is :regkey" 


    it "returns list of available operations for field type 'string'" 


    it "returns list of available operations for field type 'integer'" 


    it "returns list of available operations for field type 'float'" 


=begin
    # there is no example of fields with fixnum datatype available for expression builder
    it "returns list of available operations for field type 'fixnum'" 

=end

    it "returns list of available operations for field type 'string_set'" 


    it "returns list of available operations for field type 'numeric_set'" 


    it "returns list of available operations for field type 'boolean'" 


    it "returns list of available operations for field type 'date'" 


    it "returns list of available operations for field type 'datetime'" 


    it "returns list of available operations for field with not recognized type" 

  end

  describe ".get_col_info" do
    it "return column info for model-virtual field" 


    it "return column info for model-virtual field" 


    it "return column info for model-invalid" 


    it "return column info for managed-field" 


    it "return column info for model.managed-field" 


    it "return column info for model.association.managed-field" 


    it "return column info for model-field" 


    it "return column info for model.association-field" 


    it "return column info for model.virtualassociation..virtualassociation-field (with sql)" 


    it "return column info for model.virtualassociation..virtualassociation-invalid" 


    it "return column info for model.invalid-active" 


    it "return column info for model.virtualassociation..virtualassociation-field (with sql)" 

  end

  describe "#sql_supports_atom?" do
    context "expression key is 'CONTAINS'" do
      context "operations with 'tag'" do
        it "returns true for tag of the main model" 


        it "returns false for tag of associated model" 

      end

      context "operation with 'field'" do
        it "returns false if format of field is model.association..association-field" 


        it "returns false if field belongs to virtual_has_many association" 


        it "returns false if field belongs to 'has_and_belongs_to_many' association" 


        it "returns false if field belongs to 'has_many' polymorhic/polymorhic association" 


        it "returns true if field belongs to 'has_many' association" 

      end
    end

    context "expression key is 'INCLUDE'" do
      it "returns false for model-virtualfield" 


      it "returns true for model-field" 


      it "returns false for model.association.virtualfield" 


      it "returns true for model.accociation.field" 


      it "returns false if format of field is model.association..association-field" 

    end

    it "returns false if expression key is 'FIND'" 


    it "returns false if expression key is 'REGULAR EXPRESSION MATCHES'" 


    it "returns false if expression key is 'REGULAR EXPRESSION DOES NOT MATCH'" 


    it "returns false if expression key is not 'CONTAINS' and operand is 'TAG'" 


    it "returns false if operand is'COUNT' on model.association" 


    it "supports sql for model.association-virtualfield (with arel)" 


    it "does not supports sql for model.association-virtualfield (no arel)" 


    it "returns true for model-field" 


    it "returns true for model.assoctiation-field" 


    it "returns false if column excluded from processing for adhoc performance metrics" 


    it "returns true if column is not excluded from processing for adhoc performance metrics" 

  end

  describe "#field_in_sql?" do
    it "returns true for model.virtualfield (with sql)" 


    it "returns false for model.virtualfield (with no sql)" 


    it "returns false for model.association-virtualfield" 


    it "returns true for model-field" 


    it "returns true for model.association-field" 


    it "returns false if column excluded from processing for adhoc performance metrics" 


    it "returns true if column not excluded from processing for adhoc performance metrics" 

  end

  describe "#evaluate" do
    before do
      @data_hash = {"guest_applications.name"   => "VMware Tools",
                    "guest_applications.vendor" => "VMware, Inc."}
    end

    it "returns true if expression evaluated to value equal to value in supplied hash" 


    it "returns false if expression evaluated to value not equal to value in supplied hash" 


    it "returns true if expression is regex and there is match in supplied hash" 


    it "returns false if expression is regex and there is no match in supplied hash" 

  end

  describe ".evaluate_atoms" do
    it "adds mapping 'result'=>false to expression if expression evaluates to false on supplied object" 

  end

  describe ".operands2rubyvalue" do
    RSpec.shared_examples :coerces_value_to_integer do |value|
      it 'coerces the value to an integer' 

    end

    let(:operator) { ">" }

    subject do
      described_class.operands2rubyvalue(operator, ops, nil)
    end

    context "when ops field equals count" do
      let(:ops) { {"field" => "<count>", "value" => "foo"} }
      include_examples :coerces_value_to_integer
    end

    context "when ops key is count" do
      let(:ops) do
        {
          "count" => "ManageIQ::Providers::InfraManager::Vm.advanced_settings",
          "value" => "foo"
        }
      end
      include_examples :coerces_value_to_integer
    end
  end

  describe "#fields" do
    it "extracts fields" 


    it "extracts tags" 


    it "extracts values" 

  end

  describe "#set_tagged_target" do
    it "will substitute a new class into the expression" 


    it "will substitute a new class and associations into the expression" 


    it "can handle OR expressions" 


    it "can handle AND expressions" 


    it "can handle NOT expressions" 


    it "will not change the target of fields" 


    it "will not change the target of counts" 

  end

  describe ".tag_details" do
    before do
      described_class.instance_variable_set(:@classifications, nil)
    end

    it "returns the tags when no path is given" 


    it "returns the added classification when no_cache option is used" 

  end

  describe "miq_adv_search_lists" do
    it ":exp_available_counts" 


    it ":exp_available_finds" 


    it ":exp_available_fields with include_id_columns" 

  end
end

