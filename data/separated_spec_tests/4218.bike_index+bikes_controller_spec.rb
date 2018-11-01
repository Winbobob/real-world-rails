require 'spec_helper'

describe BikesController do
  describe 'index' do
    include_context :geocoder_default_location
    let!(:non_stolen_bike) { FactoryGirl.create(:bike, serial_number: '1234567890') }
    let!(:stolen_bike) { FactoryGirl.create(:stolen_bike, latitude: default_location[:latitude], longitude: default_location[:longitude]) }
    let(:serial) { '1234567890' }
    let!(:stolen_bike_2) { FactoryGirl.create(:stolen_bike, latitude: 41.8961603, longitude: -87.677215) }
    let(:ip_address) { '127.0.0.1' }
    let(:target_location) { ['New York', 'NY', 'US'] }
    let(:target_interpreted_params) { Bike.searchable_interpreted_params(query_params, ip: ip_address) }
    context 'with subdomain' do
      it 'redirects to no subdomain' 

    end
    describe 'assignment' do
      context 'no params' do
        it 'assigns defaults, stolenness: stolen' 

      end
      context 'query_items and serial search' do
        let(:manufacturer) { non_stolen_bike.manufacturer }
        let(:color) { non_stolen_bike.primary_frame_color }
        let(:query_params) { { serial: "#{serial}0d", query_items: [color.search_id, manufacturer.search_id], stolenness: 'non' } }
        let(:target_selected_query_items_options) { Bike.selected_query_items_options(target_interpreted_params) }
        it 'assigns passed parameters, assigns close_serials' 

      end
      context 'ip proximity' do
        let(:query_params) { { location: 'yoU', distance: 1, stolenness: 'proximity' } }
        context 'found location' do
          it 'assigns passed parameters and close_serials' 

        end
        context 'ip passed as parameter' do
          let(:ip_query_params) { query_params.merge(location: 'IP') }
          it 'assigns passed parameters and close_serials' 

        end
        context 'no location' do
          let(:ip_query_params) { query_params.merge(location: '   ') }
          it 'assigns passed parameters and close_serials' 

        end
        context 'unknown location' do
          let(:bounding_box) { [66.00, -84.22, 67.000, (0.0 / 0)] } # Override bounding box stub in geocoder_default_location
          it 'includes a flash[:info] for unknown location, renders non-proximity' 

        end
      end
      context 'passed all permitted params' do
        let(:query_params) do
          {
            query: '1',
            manufacturer: '2',
            colors: %w(3 4),
            location: '5',
            distance: '6',
            serial: '9',
            query_items: %w(7 8),
            stolenness: 'all'
          }.as_json
        end
        it 'sends all the params we want to searchable_interpreted_params' 

      end
    end
  end

  describe 'show' do
    let(:ownership) { FactoryGirl.create(:ownership) }
    let(:user) { ownership.creator }
    let(:bike) { ownership.bike }
    context 'legacy' do
      context 'showing' do
        it 'shows the bike' 

      end
      context 'example bike' do
        it 'shows the bike' 

      end
      context 'hidden bikes' do
        context 'admin hidden (fake delete)' do
          it 'redirects and sets the flash' 

        end
        context 'user hidden bike' do
          before do
            ownership.bike.update_attributes(marked_user_hidden: 'true')
          end
          context 'owner of bike viewing' do
            it 'responds with success' 

          end
          context 'Admin viewing' do
            it 'responds with success' 

          end
          context 'non-owner non-admin viewing' do
            it 'redirects' 

          end
        end
      end
      context 'too large of integer bike_id' do
        it 'responds with not found' 

      end
    end
    context 'qr code gif' do
      it 'renders' 

    end
  end

  describe 'spokecard' do
    it 'renders the page from bike id' 

  end

  describe "scanned" do
    let(:bike) { FactoryGirl.create(:bike) }
    let!(:bike_code) { FactoryGirl.create(:bike_code, bike: bike, code: 900) }
    context "organized no bike" do
      let(:organization) { FactoryGirl.create(:organization) }
      let!(:bike_code2) { FactoryGirl.create(:bike_code, organization: organization, code: 900) }
      let!(:user) { FactoryGirl.create(:confirmed_user) }
      before { set_current_user(user) }
      it "renders the scanned page" 

      context "user part of organization" do
        let!(:user) { FactoryGirl.create(:organization_member, organization: organization) }
        it "makes current_organization the organization" 

      end
    end
    context "code_id" do
      it "redirects to the proper page" 

    end
    context "code_id" do
      let!(:bike_code) { FactoryGirl.create(:bike_code, code: "sss", bike: bike) }
      it "redirects to the proper page" 

    end
    context "id" do
      it "redirects to the proper page" 

    end
  end

  describe 'new' do
    context 'not signed in' do
      it 'sets redirect_to' 

    end

    context 'signed in' do
      include_context :logged_in_as_user
      let(:manufacturer) { FactoryGirl.create(:manufacturer) }
      let(:color) { FactoryGirl.create(:color) }
      context 'passed stolen param' do
        it 'renders a new stolen bike' 

      end
      context 'passed recovered param' do
        it 'renders a new recovered bike' 

      end
      context 'stolen from params' do
        it 'renders a new stolen bike' 

      end
      context 'bike through b_param' do
        let(:bike_attrs) do
          {
            manufacturer_id: manufacturer.id,
            primary_frame_color_id: color.id,
            owner_email: 'something@stuff.com'
          }
        end
        context 'valid b_param' do
          it 'renders the bike from b_param' 

        end
        context 'partial registration by organization' do
          let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
          let(:organized_bike_attrs) { bike_attrs.merge(creation_organization_id: organization.id) }
          it 'renders for the user (even though a different creator)' 

        end
        context 'invalid b_param' do
          it 'renders a new bike, has a flash message' 

        end
      end
      context "created bike" do
        let(:bike) { FactoryGirl.create(:bike) }
        let(:b_param) { BParam.create(params: { bike: {} }, created_bike_id: bike.id, creator_id: user.id) }
        it "redirects to the bike" 

      end
    end
  end

  describe 'create' do
    # This is the create action for bikes controller
    let(:manufacturer) { FactoryGirl.create(:manufacturer) }
    let(:color) { FactoryGirl.create(:color) }
    let(:cycle_type) { FactoryGirl.create(:cycle_type) }
    let(:handlebar_type) { FactoryGirl.create(:handlebar_type) }

    describe 'embeded' do
      let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
      let(:user) { organization.auto_user }
      let(:b_param) { BParam.create(creator_id: organization.auto_user.id, params: { creation_organization_id: organization.id, embeded: true }) }
      let(:bike_params) do
        {
          serial_number: '69',
          b_param_id_token: b_param.id_token,
          creation_organization_id: organization.id,
          embeded: true,
          additional_registration: 'Testly secondary',
          cycle_type_id: cycle_type.id,
          manufacturer_id: manufacturer.id,
          manufacturer_other: '',
          primary_frame_color_id: color.id,
          handlebar_type_id: handlebar_type.id,
          owner_email: 'flow@goodtimes.com'
        }
      end
      let(:testable_bike_params) { bike_params.except(:b_param_id_token, :embeded) }
      context 'non-stolen' do
        it 'creates a new ownership and bike from an organization' 

      end
      context 'stolen' do
        let(:state) { FactoryGirl.create(:state) }
        let(:country) { state.country }
        let(:target_time) { Time.now.to_i }
        let(:stolen_params) do
          {
            country_id: country.id,
            street: '2459 W Division St',
            city: 'Chicago',
            zipcode: '60622',
            state_id: state.id,
            date_stolen: (Time.now - 1.day).utc,
            timezone: "UTC"
          }
        end
        context 'valid' do
          context 'with old style date input' do
            it 'creates a new ownership and bike from an organization' 

          end
          context 'new date input' do
            let(:alt_stolen_params) { stolen_params.merge(date_stolen: "2018-07-28T23:34:00", timezone: "America/New_York") }
            let(:target_time) { 1532835240 }
            it 'creates a new ownership and bike from an organization' 

          end
        end
        context 'invalid' do
          it 'renders the stolen form with all the attributes' 

        end
      end
    end

    describe 'extended embeded submission' do
      let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
      let(:bike_params) do
        {
          serial_number: '69',
          b_param_id_token: b_param.id_token,
          creation_organization_id: organization.id,
          embeded: true,
          embeded_extended: true,
          cycle_type_id: cycle_type.id,
          manufacturer_id: manufacturer.slug,
          primary_frame_color_id: color.id,
          handlebar_type_id: handlebar_type.id,
          owner_email: 'Flow@goodtimes.com'
        }
      end
      let(:b_param) { BParam.create(creator_id: organization.auto_user.id, params: { creation_organization_id: organization.id, embeded: true }) }
      before do
        expect(b_param).to be_present
      end
      context 'with an image' do
        it 'registers a bike and uploads an image' 

      end
      context "with persisted email and non-member and parent organization" do
        let(:organization_parent) { FactoryGirl.create(:organization) }
        let(:organization) { FactoryGirl.create(:organization_with_auto_user, parent_organization_id: organization_parent.id) }
        let!(:user2) { FactoryGirl.create(:confirmed_user) }
        it "registers a bike and redirects with persist_email" 

      end
      context "with organization bike code and signed in member" do
        let!(:user) { FactoryGirl.create(:organization_member, organization: organization) }
        let!(:bike_code) { FactoryGirl.create(:bike_code, organization: organization, code: "aaa", kind: "sticker") }
        let!(:wrong_bike_code) { FactoryGirl.create(:bike_code, code: "aaa", kind: "sticker") }
        it "registers a bike under signed in user and redirects with persist_email" 

      end
    end

    context 'standard web form submission' do
      include_context :logged_in_as_user

      context 'legacy b_param' do
        let(:bike_params) do
          {
            serial_number: '1234567890',
            b_param_id_token: b_param.id_token,
            cycle_type_id: cycle_type.id,
            manufacturer_id: manufacturer.name,
            rear_tire_narrow: 'true',
            rear_wheel_size_id: FactoryGirl.create(:wheel_size).id,
            primary_frame_color_id: color.id,
            handlebar_type_id: handlebar_type.id,
            owner_email: user.email
          }
        end

        context 'b_param not owned by user' do
          let(:other_user) { FactoryGirl.create(:user) }
          let(:b_param) { FactoryGirl.create(:b_param, creator: other_user) }
          it "does not use the b_param if isn't owned by user" 

        end

        context 'stolen b_param from user' do
          let(:b_param) { FactoryGirl.create(:b_param, creator: user) }
          it 'creates a new stolen bike and assigns the user phone' 

        end
        context 'organization b_param' do
          let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
          let(:b_param) { FactoryGirl.create(:b_param, creator: organization.auto_user) }
          it 'creates a new ownership and bike from an organization' 

        end
      end

      context 'no existing b_param and stolen' do
        let(:wheel_size) { FactoryGirl.create(:wheel_size) }
        let(:country) { Country.united_states }
        let(:state) { FactoryGirl.create(:state, country: country) }
        let(:bike_params) do
          {
            b_param_id_token: '',
            cycle_type_id: CycleType.bike.id.to_s,
            serial_number: 'example serial',
            manufacturer_other: '',
            year: '2016',
            frame_model: 'Cool frame model',
            primary_frame_color_id: color.id.to_s,
            secondary_frame_color_id: '',
            tertiary_frame_color_id: '',
            owner_email: 'something@stuff.com',
            phone: '312.379.9513',
            stolen: true
          }
        end
        let(:stolen_params) do
          {
            country_id: country.id,
            street: '2459 W Division St',
            city: 'Chicago',
            zipcode: '60622',
            state_id: state.id
          }
        end
        before do
          expect(BParam.all.count).to eq 0
        end
        context 'successful creation' do
          it "creates a bike and doesn't create a b_param" 

        end
        context 'failure' do
          it 'assigns a bike and a stolen record with the attrs passed' 

        end
      end
      context 'existing b_param' do
        context 'no bike' do
          let(:bike_params) do
            {
              cycle_type_id: CycleType.bike.id.to_s,
              serial_number: 'example serial',
              manufacturer_other: '',
              year: '2016',
              frame_model: 'Cool frame model',
              primary_frame_color_id: color.id.to_s,
              secondary_frame_color_id: '',
              tertiary_frame_color_id: '',
              owner_email: 'something@stuff.com'
            }
          end
          it 'creates a bike' 

        end
        context 'created bike' do
          it 'redirects to the bike' 

        end
      end
    end
  end

  describe 'edit' do
    let(:ownership) { FactoryGirl.create(:ownership) }
    let(:bike) { ownership.bike }
    let(:edit_templates) do
      {
        root: 'Bike Details',
        photos: 'Photos',
        drivetrain: 'Wheels + Drivetrain',
        accessories: 'Accessories + Components',
        ownership: 'Groups + Ownership',
        remove: 'Hide or Delete'
      }
    end
    let(:non_stolen_edit_templates) { edit_templates.merge(stolen: 'Report Stolen or Missing') }
    let(:stolen_edit_templates) { { stolen: 'Theft details' }.merge(edit_templates) }
    let(:recovery_edit_templates) { { stolen: 'Recovery details' }.merge(edit_templates) }

    context 'no user' do
      it 'redirects and sets the flash' 

    end
    context 'user present' do
      let(:user) { FactoryGirl.create(:user) }
      before { set_current_user(user) }
      context "user present but isn't allowed to edit the bike" do
        it 'redirects and sets the flash' 

      end
      context "user present but hasn't claimed the bike" do
        it 'claims and renders' 

      end
      context 'not-creator but member of creation_organization' do
        let(:ownership) { FactoryGirl.create(:organization_ownership) }
        let(:organization) { bike.creation_organization }
        let(:user) { FactoryGirl.create(:organization_member, organization: organization) }
        it 'renders' 

      end
    end
    context 'user allowed to edit the bike' do
      let(:user) { ownership.creator }
      context 'revised' do
        before { set_current_user(user) }
        context 'root' do
          context 'non-stolen bike' do
            it 'renders the bike_details template' 

          end
          context 'stolen bike' do
            it 'renders with stolen as first template, different description' 

          end
          context 'recovered bike' do
            it 'renders with recovered as first template, different description' 

          end
        end
        # Grab all the template keys from the controller so we can test that we render all of them
        # Both to ensure we get all of them and because we can't use the let block
        bc = BikesController.new
        bc.instance_variable_set(:@bike, Bike.new)
        bc.edit_templates_hash.keys.map(&:to_s).each do |template|
          context template do
            it 'renders the template' 

          end
        end
      end
    end
  end

  describe 'update' do
    context 'user is present but is not allowed to edit' do
      it 'does not update and redirects' 

    end

    context 'creator present (who is allowed to edit)' do
      let(:ownership) { FactoryGirl.create(:ownership) }
      let(:user) { ownership.creator }
      let(:bike) { ownership.bike }
      before do
        set_current_user(user)
      end
      context 'legacy' do
        it 'allows you to edit an example bike' 


        it 'updates the bike and components' 


        it 'marks the bike unhidden' 


        it 'creates a new ownership if the email changes' 


        it "redirects to return_to if it's a valid url" 


        it "doesn't redirect and clears the session if not a valid url" 

      end
      context 'revised' do
        # We're testing a few things in here:
        # Firstly, new stolen update code paths
        # Also, that we can apply stolen changes to hidden bikes
        # And finally, that it redirects to the correct page
        context 'stolen update' do
          let(:state) { FactoryGirl.create(:state) }
          let(:country) { state.country }
          let(:stolen_record) { FactoryGirl.create(:stolen_record, bike: bike, city: 'party') }
          let(:target_time) { 1454925600 }
          let(:stolen_attrs) do
            {
              date_stolen: "2016-02-08 04:00:00",
              timezone: "America/Chicago",
              phone: '9999999999',
              street: '66666666 foo street',
              country_id: country.id,
              city: 'Chicago',
              zipcode: '60647',
              state_id: state.id,
              locking_description: 'Some description',
              lock_defeat_description: 'It was cuttttt',
              theft_description: 'Someone stole it and stuff',
              police_report_number: '#444444',
              police_report_department: 'department of party',
              secondary_phone: '8888888888',
              proof_of_ownership: 1,
              receive_notifications: 0,
              estimated_value: '1200'
            }
          end
          let(:bike_attrs) do
            {
              stolen: true,
              stolen_records_attributes: {
                '0' => stolen_attrs
              }
            }
          end
          let(:skipped_attrs) { %w(proof_of_ownership receive_notifications timezone date_stolen estimated_value).map(&:to_sym) }
          it 'updates and returns to the right page' 

          context 'recovered bike' do
            it 'marks the bike recovered'
          end
        end
      end
    end
    context 'owner present (who is allowed to edit)' do
      let(:color) { FactoryGirl.create(:color) }
      let(:user) { FactoryGirl.create(:confirmed_user) }
      let(:ownership) { FactoryGirl.create(:organization_ownership, owner_email: user.email) }
      let(:bike) { ownership.bike }
      let(:organization) { bike.organizations.first }
      let(:organization_2) { FactoryGirl.create(:organization) }
      let(:allowed_attributes) do
        {
          description: '69 description',
          marked_user_hidden: '0',
          primary_frame_color_id: color.id,
          secondary_frame_color_id: color.id,
          tertiary_frame_color_id: Color.black.id,
          handlebar_type_id: HandlebarType.flat.id,
          coaster_brake: true,
          belt_drive: true,
          front_gear_type_id: FactoryGirl.create(:front_gear_type).id,
          rear_gear_type_id: FactoryGirl.create(:rear_gear_type).id,
          owner_email: 'new_email@stuff.com',
          year: 1993,
          frame_model: 'A sweet model named things',
          frame_material_id: FrameMaterial.steel.id,
          frame_size: '56cm',
          name: 'a sweet name for a bike',
          additional_registration: 'some weird other number',
          bike_organization_ids: "#{organization_2.id}, #{organization.id}"
        }
      end
      let(:skipped_attrs) { %w(marked_user_hidden bike_organization_ids).map(&:to_sym) }
      before do
        ownership.mark_claimed
        set_current_user(user)
        expect(ownership.owner).to eq user
      end
      it 'updates the bike with the allowed_attributes' 

    end
  end

  describe 'show with recovery token present' do
    let(:bike) { FactoryGirl.create(:stolen_bike) }
    let(:stolen_record) { bike.current_stolen_record }
    let(:recovery_link_token) { stolen_record.find_or_create_recovery_link_token }
    it 'renders a mark recovered modal, and deletes the session recovery_link_token' 

  end
end

