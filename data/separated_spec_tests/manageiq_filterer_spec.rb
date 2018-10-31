describe Rbac::Filterer do
  describe "using expressions as managed filters" do
    it "supports OR conditions across categories" 


    it "supports AND conditions within categories" 


    def create_group_with_expression(expression)
      role = FactoryGirl.create(:miq_user_role)
      group = FactoryGirl.create(:miq_group, :tenant => Tenant.root_tenant, :miq_user_role => role)
      group.entitlement = Entitlement.new
      group.entitlement.filter_expression = expression
      group.save!
      group
    end
  end

  describe '.combine_filtered_ids' do
    # Algorithm (from Rbac::Filterer.combine_filtered_ids):
    # b_intersection_m        = (belongsto_filtered_ids INTERSECTION managed_filtered_ids)
    # u_union_d_union_b_and_m = user_filtered_ids UNION descendant_filtered_ids UNION belongsto_filtered_ids
    # filter                  = u_union_d_union_b_and_m INTERSECTION tenant_filter_ids

    def combine_filtered_ids(user_filtered_ids, belongsto_filtered_ids, managed_filtered_ids, descendant_filtered_ids, tenant_filter_ids)
      Rbac::Filterer.new.send(:combine_filtered_ids, user_filtered_ids, belongsto_filtered_ids, managed_filtered_ids, descendant_filtered_ids, tenant_filter_ids)
    end

    it 'only user filter(self service user)' 


    it 'only belongs to filter(Host & Cluster filter)' 


    it 'only managed filter(tags)' 


    it 'only descendants filter' 


    it 'only tenant filter' 


    it 'belongs to and tenant filter' 


    it 'belongs to and managed filters(Host & Cluster filter and tags)' 


    it 'user filter, belongs to and managed filters(self service user, Host & Cluster filter and tags)' 


    it 'user filter, belongs to, managed filters and descendants filter(self service user, Host & Cluster filter and tags)' 


    it 'user filter, belongs to managed filters, descendants filter and tenant filter(self service user, Host & Cluster filter and tags)' 


    it 'belongs to managed filters, descendants filter and tenant filter(self service user, Host & Cluster filter and tags)' 

  end

  before { allow(User).to receive_messages(:server_timezone => "UTC") }

  let(:default_tenant)     { Tenant.seed }

  let(:admin_user)         { FactoryGirl.create(:user, :role => "super_administrator") }

  let(:owner_tenant)       { FactoryGirl.create(:tenant) }
  let(:owner_group)        { FactoryGirl.create(:miq_group, :tenant => owner_tenant) }
  let(:owner_user)         { FactoryGirl.create(:user, :miq_groups => [owner_group]) }
  let(:owned_vm)           { FactoryGirl.create(:vm_vmware, :tenant => owner_tenant) }

  let(:other_tenant)       { FactoryGirl.create(:tenant) }
  let(:other_group)        { FactoryGirl.create(:miq_group, :tenant => other_tenant) }
  let(:other_user)         { FactoryGirl.create(:user, :miq_groups => [other_group]) }
  let(:other_vm)           { FactoryGirl.create(:vm_vmware, :tenant => other_tenant) }

  let(:child_tenant)       { FactoryGirl.create(:tenant, :divisible => false, :parent => owner_tenant) }
  let(:child_group)        { FactoryGirl.create(:miq_group, :tenant => child_tenant) }
  let(:child_openstack_vm) { FactoryGirl.create(:vm_openstack, :tenant => child_tenant, :miq_group => child_group) }

  describe ".search" do
    context 'for MiqRequests' do
      # MiqRequest for owner group
      let!(:miq_request_user_owner) { FactoryGirl.create(:miq_provision_request, :tenant => owner_tenant, :requester => owner_user) }
      # User for owner group
      let(:user_a)                        { FactoryGirl.create(:user, :miq_groups => [owner_group]) }

      # MiqRequests for other group
      let!(:miq_request_user_a)     { FactoryGirl.create(:miq_provision_request, :tenant => owner_tenant, :requester => other_user) }
      let!(:miq_request_user_b)     { FactoryGirl.create(:miq_provision_request, :tenant => owner_tenant, :requester => user_b) }

      # other_group is from owner_tenant
      let(:other_group)                   { FactoryGirl.create(:miq_group, :tenant => owner_tenant) }
      # User for other group
      let(:user_b)                        { FactoryGirl.create(:user, :miq_groups => [other_group]) }

      context "self service user (User or group owned)" do
        before do
          allow(other_group).to receive(:self_service?).and_return(true)
          allow(owner_group).to receive(:self_service?).and_return(true)
        end

        context 'users are in same tenant as requester' do
          it "displays requests of user's of group owner_group" 


          it "displays requests for users of other_user's group (other_group) so also for user_c" 

        end
      end

      context "limited self service user (only user owned)" do
        before do
          allow(other_group).to receive(:limited_self_service?).and_return(true)
          allow(other_group).to receive(:self_service?).and_return(true)
          allow(owner_group).to receive(:limited_self_service?).and_return(true)
          allow(owner_group).to receive(:self_service?).and_return(true)
        end

        context 'users are in same tenant as requester' do
          it "displays requests of user's of group owner_group" 


          it "displays requests for users of other_user's group (other_group) so also for user_c" 

        end
      end
    end

    context 'with tags' do
      let(:role)         { FactoryGirl.create(:miq_user_role) }
      let(:tagged_group) { FactoryGirl.create(:miq_group, :tenant => Tenant.root_tenant, :miq_user_role => role) }
      let(:user)         { FactoryGirl.create(:user, :miq_groups => [tagged_group]) }

      before do
        tagged_group.entitlement = Entitlement.new
        tagged_group.entitlement.set_belongsto_filters([])
        tagged_group.entitlement.set_managed_filters([["/managed/environment/prod"]])
        tagged_group.save!
      end

      context 'searching for instances of ConfigurationScriptSource' do
        let!(:configuration_script_source) { FactoryGirl.create_list(:embedded_ansible_configuration_script_source, 2).first }

        it 'lists only tagged ConfigurationScriptSources' 

      end

      context 'searching for instances of AuthKeyPair' do
        let!(:auth_key_pair_cloud) { FactoryGirl.create_list(:auth_key_pair_cloud, 2).first }

        it 'lists only tagged AuthKeyPairs' 

      end

      context 'searching for instances of HostAggregate' do
        let!(:host_aggregate) { FactoryGirl.create_list(:host_aggregate, 2).first }

        it 'lists only tagged HostAggregates' 

      end

      context "searching for tenants" do
        before do
          owner_tenant.tag_with('/managed/environment/prod', :ns => '*')
        end

        it 'list tagged tenants' 

      end
    end

    context 'with virtual custom attributes' do
      let(:virtual_custom_attribute_1) { "virtual_custom_attribute_attribute_1" }
      let(:virtual_custom_attribute_2) { "virtual_custom_attribute_attribute_2" }
      let!(:vm_1)                { FactoryGirl.create(:vm) }
      let!(:vm_2)                { FactoryGirl.create(:vm) }

      let!(:custom_attribute_1) do
        FactoryGirl.create(:custom_attribute, :name => 'attribute_1', :value => vm_1.name, :resource => vm_1)
      end

      let!(:custom_attribute_2) do
        FactoryGirl.create(:custom_attribute, :name => 'attribute_2', :value => 'any_value', :resource => vm_1)
      end

      let(:miq_expression) do
        exp1 = {'EQUAL' => {'field' => 'Vm-name', 'value' => "Vm-#{virtual_custom_attribute_1}"}}
        exp2 = {'EQUAL' => {'field' => "Vm-#{virtual_custom_attribute_2}", "value" => 'any_value'}}

        MiqExpression.new("AND" => [exp1, exp2])
      end

      it 'returns instance of Vm with related condition' 

    end

    describe "with find_options_for_tenant filtering (basic) all resources" do
      {
        "ExtManagementSystem"    => :ems_vmware,
        "MiqAeDomain"            => :miq_ae_domain,
        # "MiqRequest"           => :miq_request,  # MiqRequest can't be instantuated, it is an abstract class
        "MiqRequestTask"         => :miq_request_task,
        "Provider"               => :provider,
        "Service"                => :service,
        "ServiceTemplate"        => :service_template,
        "ServiceTemplateCatalog" => :service_template_catalog,
        "Vm"                     => :vm_vmware
      }.each do |klass, factory_name|
        it "with :user finds #{klass}" 

      end
    end

    context 'when class does not participate in RBAC' do
      before do
        @vm = FactoryGirl.create(:vm_vmware, :name => "VM1", :host => @host1, :ext_management_system => @ems)
        ["2010-04-14T20:52:30Z", "2010-04-14T21:51:10Z"].each do |t|
          @vm.metric_rollups << FactoryGirl.create(:metric_rollup_vm_hr, :timestamp => t)
        end
      end
      let(:miq_ae_domain) { FactoryGirl.create(:miq_ae_domain) }

      it 'returns the same class as input for MiqAeDomain' 


      it 'returns the same class as input for parent class that is not STI' 


      it 'returns the same class as input for subclass that is not STI' 

    end

    context "with non-sql filter" do
      subject { described_class.new }

      let(:expression)        { MiqExpression.new("=" => {"field" => "Vm-vendor_display", "value" => "VMware"}) }
      let(:search_attributes) { { :class => "Vm", :filter => expression } }
      let(:results)           { subject.search(search_attributes).first }

      before { [owned_vm, other_vm] }

      it "finds the Vms" 


      it "does not add references without includes" 


      context "with :include_for_find" do
        let(:include_search) { search_attributes.merge(:include_for_find => {:evm_owner => {}}) }
        let(:results)        { subject.search(include_search).first }

        it "finds the Vms" 


        it "does not add references since there isn't a SQL filter" 


        context "with a references based where_clause" do
          let(:search_with_where) { include_search.merge(:where_clause => ['"users"."id" = ?', owner_user.id]) }
          let(:results)           { subject.search(search_with_where).first }

          it "will try to skip references to begin with" 

        end
      end
    end

    context "with a miq_expression filter on vms" do
      let(:expression)        { MiqExpression.new("=" => {"field" => "Vm-vendor", "value" => "vmware"}) }
      let(:search_attributes) { { :class => "Vm", :filter => expression } }
      let(:results)           { described_class.search(search_attributes).first }

      before { [owned_vm, other_vm] }

      it "finds the Vms" 


      it "does not add references without includes" 


      context "with :include_for_find" do
        let(:include_search) { search_attributes.merge(:include_for_find => {:evm_owner => {}}) }
        let(:results)        { described_class.search(include_search).first }

        it "finds the Service" 


        it "adds references" 

      end
    end

    context "with :extra_cols on a Service" do
      let(:extra_cols)        { [:owned_by_current_user] }
      let(:search_attributes) { { :class => "Service", :extra_cols => extra_cols } }
      let(:results)           { described_class.search(search_attributes).first }

      before { FactoryGirl.create :service, :evm_owner => owner_user }

      it "finds the Service" 


      it "does not add references with no includes" 


      context "with :include_for_find" do
        let(:include_search) { search_attributes.merge(:include_for_find => {:evm_owner => {}}) }
        let(:results)        { described_class.search(include_search).first }

        it "finds the Service" 


        it "adds references" 

      end
    end

    describe "with find_options_for_tenant filtering" do
      before do
        owned_vm # happy path
        other_vm # sad path
      end

      it "with User.with_user finds Vm" 


      it "with :user finds Vm" 


      it "with :userid finds Vm" 


      it "with :miq_group, finds Vm" 


      it "with :miq_group_id finds Vm" 


      it "leaving tenant doesnt find Vm" 


      describe "with accessible_tenant_ids filtering (strategy = :descendants_id)" do
        it "can't see parent tenant's Vm" 


        it "can see descendant tenant's Vms" 


        it "can see descendant tenant's Openstack Vm" 


        it "can see current tenant's descendants when non-admin user is logged" 


        it "can see current tenant's descendants when admin user is logged" 

      end

      context "with accessible_tenant_ids filtering (strategy = :parent_ids)" do
        it "can see parent tenant's EMS" 


        it "can't see descendant tenant's EMS" 

      end

      context "with accessible_tenant_ids filtering (strategy = nil aka tenant only)" do
        it "can see tenant's request task" 


        it "can't see parent tenant's request task" 


        it "can't see descendant tenant's request task" 

      end

      context "tenant access strategy VMs and Templates" do
        let(:owned_template) { FactoryGirl.create(:template_vmware, :tenant => owner_tenant) }
        let(:child_tenant)   { FactoryGirl.create(:tenant, :divisible => false, :parent => owner_tenant) }
        let(:child_group)    { FactoryGirl.create(:miq_group, :tenant => child_tenant) }

        context 'with Vm as resource of VmPerformance model' do
          let!(:root_tenant_vm)              { FactoryGirl.create(:vm_vmware, :tenant => Tenant.root_tenant) }
          let!(:vm_performance_root_tenant)  { FactoryGirl.create(:vm_performance, :resource => root_tenant_vm) }
          let!(:vm_performance_other_tenant) { FactoryGirl.create(:vm_performance, :resource => other_vm) }

          it 'list only other_user\'s VmPerformances' 


          it 'list all VmPerformances' 


          context 'with tags' do
            let(:role)         { FactoryGirl.create(:miq_user_role) }
            let(:tagged_group) { FactoryGirl.create(:miq_group, :tenant => Tenant.root_tenant, :miq_user_role => role) }
            let(:user)         { FactoryGirl.create(:user, :miq_groups => [tagged_group]) }

            before do
              tagged_group.entitlement = Entitlement.new
              tagged_group.entitlement.set_belongsto_filters([])
              tagged_group.entitlement.set_managed_filters([["/managed/environment/prod"]])
              tagged_group.save!
            end

            it 'lists only VmPerformances with tagged resources without any tenant restriction' 


            it 'lists only VmPerformances with tagged resources with any tenant restriction' 

          end
        end

        context "searching MiqTemplate" do
          it "can't see descendant tenant's templates" 


          it "can see ancestor tenant's templates" 

        end

        context "searching VmOrTemplate" do
          let(:child_child_tenant) { FactoryGirl.create(:tenant, :divisible => false, :parent => child_tenant) }
          let(:child_child_group)  { FactoryGirl.create(:miq_group, :tenant => child_child_tenant) }

          it "can't see descendant tenant's templates but can see descendant tenant's VMs" 


          it "can see ancestor tenant's templates but can't see ancestor tenant's VMs" 


          it "can see ancestor tenant's templates and descendant tenant's VMs" 


          it "can't see descendant tenant's templates nor ancestor tenant's VMs" 

        end
      end

      context "tenant 0" do
        it "can see requests owned by any tenants" 

      end
    end

    context "searching for hosts" do
      it "can filter results by vmm_vendor" 

    end

    context "searching for vms" do
      it "can filter results by vendor" 

    end

    context "for Metrics::Rollup" do
      before do
        vm = FactoryGirl.create(:vm_vmware)
        FactoryGirl.create(
          :metric_rollup_vm_daily,
          :resource_id => vm.id,
          :timestamp   => "2010-04-14T00:00:00Z"
        )

        # Typical includes for rendering daily metrics charts
        @include = {
          :max_derived_cpu_available       => {},
          :max_derived_cpu_reserved        => {},
          :min_cpu_usagemhz_rate_average   => {},
          :max_cpu_usagemhz_rate_average   => {},
          :min_cpu_usage_rate_average      => {},
          :max_cpu_usage_rate_average      => {},
          :v_pct_cpu_ready_delta_summation => {},
          :v_pct_cpu_wait_delta_summation  => {},
          :v_pct_cpu_used_delta_summation  => {},
          :max_derived_memory_available    => {},
          :max_derived_memory_reserved     => {},
          :min_derived_memory_used         => {},
          :max_derived_memory_used         => {},
          :min_disk_usage_rate_average     => {},
          :max_disk_usage_rate_average     => {},
          :min_net_usage_rate_average      => {},
          :max_net_usage_rate_average      => {},
          :v_derived_storage_used          => {},
          :resource                        => {}
        }
      end

      # NOTE:  Think long and hard before you consider removing this test.
      # Many-a-hours wasted here determining this bug that resulted in
      # re-adding this test again.
      it "should not raise an error when a polymorphic reflection is included" 

    end
  end

  context "common setup" do
    let(:group) { FactoryGirl.create(:miq_group, :tenant => default_tenant) }
    let(:user)  { FactoryGirl.create(:user, :miq_groups => [group]) }

    before do
      @tags = {
        2 => "/managed/environment/prod",
        3 => "/managed/environment/dev",
        4 => "/managed/service_level/gold",
        5 => "/managed/service_level/silver"
      }
    end

    def get_rbac_results_for_and_expect_objects(klass, expected_objects)
      User.current_user = user

      results = described_class.search(:class => klass).first
      expect(results).to match_array(expected_objects)
    end

    context 'with Middleware models' do
      context 'with tags' do
        before do
          group.entitlement = Entitlement.new
          group.entitlement.set_belongsto_filters([])
          group.entitlement.set_managed_filters([["/managed/environment/prod"]])
          group.save!
        end

        let(:count_of_created_instances) { 2 }

        %w(
          MiddlewareDatasource
          MiddlewareDeployment
          MiddlewareDomain
          MiddlewareMessaging
          MiddlewareServer
          MiddlewareServerGroup
        ).each do |middleware_model|
          it "returns tagged instance of #{middleware_model}" 

        end
      end
    end

    context "with User and Group" do
      context 'with tags' do
        let!(:tagged_group) { FactoryGirl.create(:miq_group, :tenant => default_tenant) }
        let!(:user)         { FactoryGirl.create(:user, :miq_groups => [tagged_group]) }
        let!(:other_user)   { FactoryGirl.create(:user, :miq_groups => [group]) }

        before do
          tagged_group.entitlement = Entitlement.new
          tagged_group.entitlement.set_belongsto_filters([])
          tagged_group.entitlement.set_managed_filters([["/managed/environment/prod"]])
          tagged_group.save!

          tagged_group.tag_with('/managed/environment/prod', :ns => '*')
          user.tag_with('/managed/environment/prod', :ns => '*')
        end

        it 'returns tagged users' 


        it 'returns tagged groups' 


        let(:tenant_administrator_user_role) do
          FactoryGirl.create(:miq_user_role, :name => MiqUserRole::DEFAULT_TENANT_ROLE_NAME)
        end

        it 'returns tagged groups when user\'s role has disallowed other roles' 

      end

      it "returns users from current user's groups" 


      it "returns user's groups" 


      context "with self-service user" do
        before do
          allow_any_instance_of(MiqGroup).to receive_messages(:self_service? => true)
        end

        it "returns only the current user" 


        it "returns only the current group" 

      end

      context 'with EvmRole-tenant_administrator' do
        let(:tenant_administrator_user_role) do
          FactoryGirl.create(:miq_user_role, :name => MiqUserRole::DEFAULT_TENANT_ROLE_NAME)
        end

        let!(:super_administrator_user_role) do
          FactoryGirl.create(:miq_user_role, :name => MiqUserRole::SUPER_ADMIN_ROLE_NAME)
        end

        let!(:administrator_user_role) do
          FactoryGirl.create(:miq_user_role, :name => MiqUserRole::ADMIN_ROLE_NAME)
        end

        let(:group) do
          FactoryGirl.create(:miq_group, :tenant => default_tenant, :miq_user_role => tenant_administrator_user_role)
        end

        let!(:user) { FactoryGirl.create(:user, :miq_groups => [group]) }

        it 'can see all roles expect to EvmRole-super_administrator' 


        it 'can see all groups expect to group with role EvmRole-super_administrator' 


        let(:super_admin_group) do
          FactoryGirl.create(:miq_group, :tenant => default_tenant, :miq_user_role => super_administrator_user_role)
        end

        let!(:super_admin_user) { FactoryGirl.create(:user, :miq_groups => [super_admin_group]) }

        it 'can see all users expect to user with group with role EvmRole-super_administrator' 

      end
    end

    context "with Hosts" do
      let(:hosts) { [@host1, @host2] }
      before do
        @host1 = FactoryGirl.create(:host, :name => "Host1", :hostname => "host1.local")
        @host2 = FactoryGirl.create(:host, :name => "Host2", :hostname => "host2.local")
      end

      context "having Metric data" do
        before do
          @timestamps = [
            ["2010-04-14T20:52:30Z", 100.0],
            ["2010-04-14T21:51:10Z", 1.0],
            ["2010-04-14T21:51:30Z", 2.0],
            ["2010-04-14T21:51:50Z", 4.0],
            ["2010-04-14T21:52:10Z", 8.0],
            ["2010-04-14T21:52:30Z", 15.0],
            ["2010-04-14T22:52:30Z", 100.0],
          ]
          @timestamps.each do |t, v|
            [@host1, @host2].each do |h|
              h.metric_rollups << FactoryGirl.create(:metric_rollup_host_hr,
                                                     :timestamp                  => t,
                                                     :cpu_usage_rate_average     => v,
                                                     :cpu_ready_delta_summation  => v * 1000, # Multiply by a factor of 1000 to maake it more realistic and enable testing virtual col v_pct_cpu_ready_delta_summation
                                                     :sys_uptime_absolute_latest => v
                                                    )
            end
          end
        end

        context "with only managed filters" do
          before do
            group.entitlement = Entitlement.new
            group.entitlement.set_managed_filters([["/managed/environment/prod"], ["/managed/service_level/silver"]])
            group.entitlement.set_belongsto_filters([])
            group.save!

            @tags = ["/managed/environment/prod"]
            @host2.tag_with(@tags.join(' '), :ns => '*')
            @tags << "/managed/service_level/silver"
          end

          it ".search finds the right HostPerformance rows" 


          it ".search filters out the wrong HostPerformance rows with :match_via_descendants option" 


          it ".search filters out the wrong HostPerformance rows" 

        end

        context "with only belongsto filters" do
          before do
            group.entitlement = Entitlement.new
            group.entitlement.set_belongsto_filters(["/belongsto/ExtManagementSystem|ems1"])
            group.entitlement.set_managed_filters([])
            group.save!

            ems1 = FactoryGirl.create(:ems_vmware, :name => 'ems1')
            @host1.update_attributes(:ext_management_system => ems1)
            @host2.update_attributes(:ext_management_system => ems1)

            root = FactoryGirl.create(:ems_folder, :name => "Datacenters")
            root.parent = ems1
            dc = FactoryGirl.create(:ems_folder, :name => "Datacenter1")
            dc.parent = root
            hfolder   = FactoryGirl.create(:ems_folder, :name => "Hosts")
            hfolder.parent = dc
            @host1.parent = hfolder
          end

          it ".search finds the right HostPerformance rows" 


          it ".search filters out the wrong HostPerformance rows" 

        end
      end

      context "with VMs and Templates" do
        before do
          @ems = FactoryGirl.create(:ems_vmware, :name => 'ems1')
          @host1.update_attributes(:ext_management_system => @ems)
          @host2.update_attributes(:ext_management_system => @ems)

          root            = FactoryGirl.create(:ems_folder, :name => "Datacenters")
          root.parent     = @ems
          dc              = FactoryGirl.create(:datacenter, :name => "Datacenter1")
          dc.parent       = root
          hfolder         = FactoryGirl.create(:ems_folder, :name => "host")
          hfolder.parent  = dc
          @vfolder        = FactoryGirl.create(:ems_folder, :name => "vm")
          @vfolder.parent = dc
          @host1.parent   = hfolder
          @vm_folder_path = "/belongsto/ExtManagementSystem|#{@ems.name}/EmsFolder|#{root.name}/EmsFolder|#{dc.name}/EmsFolder|#{@vfolder.name}"

          @vm       = FactoryGirl.create(:vm_vmware,       :name => "VM1",       :host => @host1, :ext_management_system => @ems)
          @template = FactoryGirl.create(:template_vmware, :name => "Template1", :host => @host1, :ext_management_system => @ems)
        end

        it "honors ems_id conditions" 


        context "search on EMSes" do
          before do
            @ems2 = FactoryGirl.create(:ems_vmware, :name => 'ems2')
          end

          it "preserves order of targets" 


          it "returns the correct class for different classes of targets" 


          it "finds both EMSes without belongsto filters" 


          it "finds one EMS with belongsto filters" 

        end

        it "search on VMs and Templates should return no objects if self-service user" 


        it "search on VMs and Templates should return both objects" 


        it "search on VMs should return a single object" 


        it "search on Templates should return a single object" 

      end

      context "when applying a filter to the provider" do
        let(:ems_cloud) { FactoryGirl.create(:ems_cloud) }

        let!(:vm_1) do
          FactoryGirl.create(:vm, :ext_management_system => ems_cloud)
        end

        let!(:vm_2) do
          FactoryGirl.create(:vm, :ext_management_system => ems_cloud)
        end

        it "returns all host's VMs and templates when host filter is set up" 

      end

      context "when applying a filter to the host and it's cluster (FB17114)" do
        before do
          @ems = FactoryGirl.create(:ems_vmware, :name => 'ems')
          @ems_folder_path = "/belongsto/ExtManagementSystem|#{@ems.name}"
          @root = FactoryGirl.create(:ems_folder, :name => "Datacenters")
          @root.parent = @ems
          @mtc = FactoryGirl.create(:datacenter, :name => "MTC")
          @mtc.parent = @root
          @mtc_folder_path = "/belongsto/ExtManagementSystem|#{@ems.name}/EmsFolder|#{@root.name}/EmsFolder|#{@mtc.name}"

          @hfolder         = FactoryGirl.create(:ems_folder, :name => "host")
          @hfolder.parent  = @mtc

          @cluster = FactoryGirl.create(:ems_cluster, :name => "MTC Development")
          @cluster.parent = @hfolder
          @cluster_folder_path = "#{@mtc_folder_path}/EmsFolder|#{@hfolder.name}/EmsCluster|#{@cluster.name}"

          @rp = FactoryGirl.create(:resource_pool, :name => "Default for MTC Development")
          @rp.parent = @cluster

          @host_1 = FactoryGirl.create(:host, :name => "Host_1", :ems_cluster => @cluster, :ext_management_system => @ems)
          @host_2 = FactoryGirl.create(:host, :name => "Host_2", :ext_management_system => @ems)

          @vm1 = FactoryGirl.create(:vm_vmware, :name => "VM1", :host => @host_1, :ext_management_system => @ems)
          @vm2 = FactoryGirl.create(:vm_vmware, :name => "VM2", :host => @host_2, :ext_management_system => @ems)

          @template1 = FactoryGirl.create(:template_vmware, :name => "Template1", :host => @host_1, :ext_management_system => @ems)
          @template2 = FactoryGirl.create(:template_vmware, :name => "Template2", :host => @host_2, :ext_management_system => @ems)
        end

        it "returns all host's VMs and templates when host filter is set up" 


        it "get all the descendants without belongsto filter" 


        it "get all the vm or templates with belongsto filter" 


        it "get all the hosts with belongsto filter" 


        it 'searches Hosts with tag and host & cluster filters' 

      end
    end

    context "with services" do
      before do
        @service1 = FactoryGirl.create(:service)
        @service2 = FactoryGirl.create(:service)
        @service3 = FactoryGirl.create(:service, :evm_owner => user)
        @service4 = FactoryGirl.create(:service, :miq_group => group)
        @service5 = FactoryGirl.create(:service, :evm_owner => user, :miq_group => group)
      end

      context ".search" do
        it "self-service group" 


        context "with self-service user" do
          before do
            allow_any_instance_of(MiqGroup).to receive_messages(:self_service? => true)
          end

          it "works when targets are empty" 

        end

        it "limited self-service group" 


        context "with limited self-service user" do
          before do
            allow_any_instance_of(MiqGroup).to receive_messages(:self_service? => true)
            allow_any_instance_of(MiqGroup).to receive_messages(:limited_self_service? => true)
          end

          it "works when targets are empty" 

        end

        it "works when targets are a list of ids" 


        it "works when targets are empty" 

      end
    end

    context 'with ansible ConfigurationScripts' do
      describe ".search" do
        let!(:ansible_configuration_script)          { FactoryGirl.create(:ansible_configuration_script) }
        let!(:ansible_configuration_script_with_tag) { FactoryGirl.create(:ansible_configuration_script) }
        let!(:ansible_playbook)                      { FactoryGirl.create(:ansible_playbook) }
        let!(:ansible_playbook_with_tag)             { FactoryGirl.create(:ansible_playbook) }

        it 'works when targets are empty' 


        context 'with tagged ConfigurationScripts' do
          before do
            group.entitlement = Entitlement.new
            group.entitlement.set_managed_filters([['/managed/environment/prod']])
            group.entitlement.set_belongsto_filters([])
            group.save!

            ansible_configuration_script_with_tag.tag_with('/managed/environment/prod', :ns => '*')
            ansible_playbook_with_tag.tag_with('/managed/environment/prod', :ns => '*')
          end

          it 'lists only tagged ConfigurationScripts' 


          it 'lists only tagged ConfigurationScriptPayload' 

        end
      end
    end

    context "with cloud network and network manager" do
      let!(:network_manager)   { FactoryGirl.create(:ems_openstack).network_manager }
      let!(:network_manager_1) { FactoryGirl.create(:ems_openstack).network_manager }

      context "with belongs_to_filter" do
        before do
          group.entitlement = Entitlement.new
          group.entitlement.set_managed_filters([])
          group.entitlement.set_belongsto_filters(["/belongsto/ExtManagementSystem|#{network_manager.name}"])
          group.save!
        end

        (described_class::NETWORK_MODELS_FOR_BELONGSTO_FILTER + [ManageIQ::Providers::NetworkManager]).each do |network_model|
          describe ".search" do
            let!(:network_object) do
              return network_manager if network_model == ManageIQ::Providers::NetworkManager
              FactoryGirl.create(network_model.underscore, :ext_management_system => network_manager)
            end

            let!(:network_object_with_different_network_manager) do
              return network_manager_1 if network_model == ManageIQ::Providers::NetworkManager
              FactoryGirl.create(network_model.underscore,  :ext_management_system => network_manager_1)
            end

            context "when records match belogns to filter" do
              it "lists records of #{network_model} manager according to belongsto filter" 

            end

            context "when records don't match belogns to filter" do
              before do
                group.entitlement = Entitlement.new
                group.entitlement.set_managed_filters([])
                group.entitlement.set_belongsto_filters(["/belongsto/ExtManagementSystem|XXXX"])
                group.save!
              end

              it "lists no records of #{network_model}" 

            end
          end
        end
      end

      context "network manager with/without tagging" do
        let!(:cloud_network)     { FactoryGirl.create(:cloud_network, :ext_management_system => network_manager) }
        let!(:cloud_network_1)   { FactoryGirl.create(:cloud_network, :ext_management_system => network_manager_1) }

        context "network manager is tagged" do
          before do
            group.entitlement = Entitlement.new
            group.entitlement.set_managed_filters([["/managed/environment/prod"]])
            group.entitlement.set_belongsto_filters([])
            group.save!

            network_manager.tag_with("/managed/environment/prod", :ns => "*")
          end

          it "doesn't list cloud networks" 


          it "lists only tagged network manager" 

        end

        context "network manager not is tagged" do
          before do
            group.entitlement = Entitlement.new
            group.entitlement.set_managed_filters([])
            group.entitlement.set_belongsto_filters([])
            group.save!
          end

          it "lists all cloud networks" 


          it "lists all network managers" 

        end
      end
    end

    context 'with network models' do
      NETWORK_MODELS = %w(
        CloudNetwork
        CloudSubnet
        FloatingIp
        LoadBalancer
        NetworkPort
        NetworkRouter
        SecurityGroup
      ).freeze

      NETWORK_MODELS.each do |network_model|
        describe ".search" do
          let!(:network_object)          { FactoryGirl.create(network_model.underscore) }
          let!(:network_object_with_tag) { FactoryGirl.create(network_model.underscore) }
          let(:network_object_ids)       { [network_object.id, network_object_with_tag.id] }

          it 'works when targets are empty' 


          context "with tagged #{network_model}" do
            before do
              group.entitlement = Entitlement.new
              group.entitlement.set_managed_filters([['/managed/environment/prod']])
              group.entitlement.set_belongsto_filters([])
              group.save!

              network_object_with_tag.tag_with('/managed/environment/prod', :ns => '*')
            end

            it "lists only tagged #{network_model}" 

          end
        end
      end
    end

    context "with tagged VMs" do
      let(:ems) { FactoryGirl.create(:ext_management_system) }

      before do
        [
          FactoryGirl.create(:host, :name => "Host1", :hostname => "host1.local"),
          FactoryGirl.create(:host, :name => "Host2", :hostname => "host2.local"),
          FactoryGirl.create(:host, :name => "Host3", :hostname => "host3.local"),
          FactoryGirl.create(:host, :name => "Host4", :hostname => "host4.local")
        ].each_with_index do |host, i|
          grp = i + 1
          guest_os = %w(_none_ windows ubuntu windows ubuntu)[grp]
          vm = FactoryGirl.build(:vm_vmware, :name => "Test Group #{grp} VM #{i}")
          vm.hardware = FactoryGirl.build(:hardware, :cpu_sockets => (grp * 2), :memory_mb => (grp * 1.megabytes), :guest_os => guest_os)
          vm.host = host
          vm.evm_owner_id = user.id  if i.even?
          vm.miq_group_id = group.id if i.odd?
          vm.ext_management_system = ems if i.even?
          vm.save
          vm.tag_with(@tags.values.join(" "), :ns => "*") if i > 0
        end

        Vm.scope :group_scope,    ->(group_num) { Vm.where("name LIKE ?", "Test Group #{group_num}%") }
        Vm.scope :is_on,          ->            { Vm.where(:power_state => "on") }
      end

      context ".search" do
        it "self-service group" 


        context "with self-service user" do
          before do
            allow_any_instance_of(MiqGroup).to receive_messages(:self_service? => true)
          end

          it "works when targets are empty" 


          it "works when passing a named_scope" 

        end

        it "limited self-service group" 


        context "with limited self-service user" do
          before do
            allow_any_instance_of(MiqGroup).to receive_messages(:self_service? => true)
            allow_any_instance_of(MiqGroup).to receive_messages(:limited_self_service? => true)
          end

          it "works when targets are empty" 


          it "works when passing a named_scope" 

        end

        it "works when targets are a list of ids" 


        it "works when targets are empty" 


        it "works when targets is a class" 


        it "works when passing a named_scope" 


        it "works when passing a named_scope with parameterized scope" 


        it "works when passing a named_scope with multiple scopes" 


        it "works when passing a named_scope with multiple mixed scopes" 


        it "works when targets are a named scope" 


        it "works when the filter is not fully supported in SQL (FB11080)" 

      end

      context "with only managed filters (FB9153, FB11442)" do
        before do
          group.entitlement = Entitlement.new
          group.entitlement.set_managed_filters([["/managed/environment/prod"], ["/managed/service_level/silver"]])
          group.save!
        end

        context ".search" do
          it "does not raise any errors when user filters are passed and search expression contains columns in a sub-table" 


          it "works when limit, offset and user filters are passed and search expression contains columns in a sub-table" 


          it "works when class does not participate in RBAC and user filters are passed" 

        end
      end
    end

    context "with group's VMs" do
      let(:group_user) { FactoryGirl.create(:user, :miq_groups => [group2, group]) }
      let(:group2) { FactoryGirl.create(:miq_group, :role => 'support') }

      before do
        4.times do |i|
          FactoryGirl.create(:vm_vmware,
                             :name             => "Test VM #{i}",
                             :connection_state => i < 2 ? 'connected' : 'disconnected',
                             :miq_group        => i.even? ? group : group2)
        end
      end

      it "when filtering on a real column" 


      it "when filtering on a virtual column (FB15509)" 

    end

    context "database configuration" do
      it "expect all database setting values returned" 

    end
  end

  describe ".filtered" do
    let(:matched_vms) { FactoryGirl.create_list(:vm_vmware, 2, :location => "good") }
    let(:other_vms)   { FactoryGirl.create_list(:vm_vmware, 1, :location => "other") }
    let(:all_vms)     { matched_vms + other_vms }

    it "skips rbac on empty empty arrays" 


    # fix once Rbac filtered is fixed
    it "skips rbac on nil targets" 


    it "supports class target" 


    it "supports scope all target" 


    it "supports scope all target" 


    it "support aaarm object" 


    # it returns objects too
    # TODO: cap number of queries here
    it "runs rbac on array target" 


    it "supports limit on scopes" 


    it "supports limits in ruby with limits on scopes" 


    it "supports order on scopes" 

  end

  describe ".filtered_object" do
    it "with :user keeps vm" 


    it "with :user filters out vm" 

  end

  describe "#include_references (private)" do
    subject { described_class.new }

    let(:skip)             { false }
    let(:klass)            { VmOrTemplate }
    let(:scope)            { klass.all }
    let(:include_for_find) { { :miq_server => {} } }
    let(:exp_includes)     { { :host => {} } }

    it "adds include_for_find .references to the scope" 


    it "adds exp_includes .references to the scope" 


    it "adds include_for_find and exp_includes .references to the scope" 


    context "if the include is polymorphic" do
      let(:klass)            { MetricRollup }
      let(:include_for_find) { { :resource => {} } }

      it "does not add .references to the scope" 

    end

    context "when skip is passed as true" do
      let(:skip) { true }

      it "does not add .references to the scope" 


      context "when the scope is invalid without .references" do
        let(:scope)           { klass.where("hosts.name = 'foo'") }
        let(:method_args)     { [scope, klass, include_for_find, exp_includes, skip] }
        let(:resulting_scope) { subject.send(:include_references, *method_args) }

        let(:explain_error_match) do
          Regexp.new(Regexp.escape(<<~PG_ERR.chomp))
            PG::UndefinedTable: ERROR:  missing FROM-clause entry for table "hosts"
            LINE 1: EXPLAIN SELECT "vms".* FROM "vms" WHERE (hosts.name = 'foo')
                                                             ^
            : EXPLAIN SELECT "vms".* FROM "vms" WHERE (hosts.name = 'foo')
          PG_ERR
        end

        it "adds .references to the scope" 


        it "warns that there was an issue in test mode" 


        it "warns that there was an issue in development mode" 


        it "does not warn that there was an issue in production mode" 

      end
    end
  end

  it ".apply_rbac_directly?" 


  it ".apply_rbac_through_association?" 


  describe "find_targets_with_direct_rbac" do
    let(:host_match) { FactoryGirl.create(:host, :hostname => 'good') }
    let(:host_other) { FactoryGirl.create(:host, :hostname => 'bad') }
    let(:vms_match) { FactoryGirl.create_list(:vm_vmware, 2, :host => host_match) }
    let(:vm_host2) { FactoryGirl.create_list(:vm_vmware, 1, :host => host_other) }
    let(:all_vms) { vms_match + vm_host2 }

    it "works with no filters" 


    it "applies find_options[:conditions, :include]" 

  end

  context ".lookup_user_group" do
    let(:filter) { described_class.new }
    let(:user1) { FactoryGirl.create(:user_with_group) }
    let(:group_list) { FactoryGirl.create_list(:miq_group, 2) }
    let(:user2) { FactoryGirl.create(:user, :miq_groups => group_list) }

    context "user_group" do
      it "uses user.current_group" 


      it "skips lookup if current_group_id passed" 


      it "skips lookup when group passed in" 


      it "uses group passed" 


      it "fallsback to current_group if not member of group" 


      it "uses group passed in when not member of group when super admin" 


      it "uses group_id passed in when not member of group when super admin" 


      it "does not update user.current_group if user is super admin" 

    end

    context "user" do
      it "uses user passed in" 


      it "uses string user passed in" 

    end
  end

  describe "cloud_tenant based search" do
    let(:ems_openstack)         { FactoryGirl.create(:ems_cloud) }
    let(:project1_tenant)       { FactoryGirl.create(:tenant, :source_type => 'CloudTenant') }
    let(:project1_cloud_tenant) { FactoryGirl.create(:cloud_tenant, :source_tenant => project1_tenant, :ext_management_system => ems_openstack) }
    let(:project1_group)        { FactoryGirl.create(:miq_group, :tenant => project1_tenant) }
    let(:project1_user)         { FactoryGirl.create(:user, :miq_groups => [project1_group]) }
    let(:project1_volume)       { FactoryGirl.create(:cloud_volume, :ext_management_system => ems_openstack, :cloud_tenant => project1_cloud_tenant) }
    let(:project1_flavor)       { FactoryGirl.create(:flavor, :ext_management_system => ems_openstack) }
    let(:project1_c_t_flavor)   { FactoryGirl.create(:cloud_tenant_flavor, :cloud_tenant => project1_cloud_tenant, :flavor => project1_flavor) }
    let(:project2_tenant)       { FactoryGirl.create(:tenant, :source_type => 'CloudTenant') }
    let(:project2_cloud_tenant) { FactoryGirl.create(:cloud_tenant, :source_tenant => project2_tenant, :ext_management_system => ems_openstack) }
    let(:project2_group)        { FactoryGirl.create(:miq_group, :tenant => project2_tenant) }
    let(:project2_user)         { FactoryGirl.create(:user, :miq_groups => [project2_group]) }
    let(:project2_volume)       { FactoryGirl.create(:cloud_volume, :ext_management_system => ems_openstack, :cloud_tenant => project2_cloud_tenant) }
    let(:project2_flavor)       { FactoryGirl.create(:flavor, :ext_management_system => ems_openstack) }
    let(:project2_c_t_flavor)   { FactoryGirl.create(:cloud_tenant_flavor, :cloud_tenant => project2_cloud_tenant, :flavor => project2_flavor) }
    let(:ems_other)             { FactoryGirl.create(:ems_cloud, :name => 'ems_other', :tenant_mapping_enabled => false) }
    let(:volume_other)          { FactoryGirl.create(:cloud_volume, :ext_management_system => ems_other) }
    let(:tenant_other)          { FactoryGirl.create(:tenant, :source_type => 'CloudTenant') }
    let(:cloud_tenant_other)    { FactoryGirl.create(:cloud_tenant, :source_tenant => tenant_other, :ext_management_system => ems_other) }
    let(:flavor_other)          { FactoryGirl.create(:flavor, :ext_management_system => ems_other) }
    let(:c_t_flavor_other)      { FactoryGirl.create(:cloud_tenant_flavor, :cloud_tenant => cloud_tenant_other, :flavor => flavor_other) }
    let!(:all_objects)          { [project1_volume, project2_volume, volume_other, cloud_tenant_other, project1_c_t_flavor, project2_c_t_flavor, c_t_flavor_other] }

    it "lists its own project's objects and other objects where tenant_mapping is not enabled" 


    it "all objects are visible to all users when tenant_mapping is not enabled" 

  end

  private

  # separate them to match easier for failures
  def expect_counts(actual, expected_targets, expected_auth_count)
    expect(actual[1]).to eq(expected_auth_count)
    expect(actual[0].to_a).to match_array(expected_targets)
  end
end

