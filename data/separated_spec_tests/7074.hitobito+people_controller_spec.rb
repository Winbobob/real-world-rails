# encoding: utf-8

#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PeopleController do

  before do
    PeopleRelation.kind_opposites['parent'] = 'child'
    PeopleRelation.kind_opposites['child'] = 'parent'
  end

  after do
    PeopleRelation.kind_opposites.clear
  end

  let(:top_leader) { people(:top_leader) }
  let(:group) { groups(:top_group) }

  context 'as top leader' do

    before { sign_in(top_leader) }

    context 'GET index' do

      before do
        @tg_member = Fabricate(Group::TopGroup::Member.name.to_sym, group: groups(:top_group)).person
        Fabricate(:phone_number, contactable: @tg_member, number: '123', label: 'Privat', public: true)
        Fabricate(:phone_number, contactable: @tg_member, number: '456', label: 'Mobile', public: false)
        Fabricate(:phone_number, contactable: @tg_member, number: '789', label: 'Office', public: true)
        Fabricate(:social_account, contactable: @tg_member, name: 'facefoo', label: 'Facebook', public: true)
        Fabricate(:social_account, contactable: @tg_member, name: 'skypefoo', label: 'Skype', public: false)
        Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one), person: @tg_member)
        @tg_extern = Fabricate(Role::External.name.to_sym, group: groups(:top_group)).person

        @bl_leader = Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person
        @bl_extern = Fabricate(Role::External.name.to_sym, group: groups(:bottom_layer_one)).person

        @bg_leader = Fabricate(Group::BottomGroup::Leader.name.to_sym, group: groups(:bottom_group_one_one)).person
        @bg_member = Fabricate(Group::BottomGroup::Member.name.to_sym, group: groups(:bottom_group_one_one)).person
        @tg_member.update_attributes(first_name: 'Al', last_name: 'Zoe', nickname: 'al', town: 'Eye', zip_code: '8000')
      end

      context 'sorting' do
        before do
          top_leader.update_attributes(first_name: 'Joe', last_name: 'Smith', nickname: 'js', town: 'Stoke', address: 'Howard Street', zip_code: '9000')
          @tg_extern.update_attributes(first_name: '', last_name: 'Bundy', nickname: '', town: '', address: '', zip_code: '')
        end

        let(:role_type_ids) { [Role::External.id, Group::TopGroup::Leader.id, Group::TopGroup::Member.id].join('-') }


        context 'default sort' do
          it "sorts by name" 


          it "people.default_sort setting can override it to sort by role" 

        end

        it "sorts based on last_name" 


        it "sorts based on roles" 


        %w(first_name nickname zip_code town).each do |attr|
          it "sorts based on #{attr}" 

        end
      end

      context 'group' do
        it 'loads all members of a group' 


        it 'loads externs of a group when type given' 


        it 'loads selected roles of a group when types given' 


        it 'loads pending person add requests' 


        context '.pdf' do
          it 'generates pdf labels' 

        end

        context 'background job' do
          it 'exports csv' 


          it 'exports xlsx' 


          it 'sets cookie on export' 

        end

        context '.vcf' do
          it 'exports vcf files' 

        end

        context '.email' do
          it 'renders email addresses' 


          it 'renders email addresses with additional ones' 

        end

        context '.json' do
          render_views

          it 'renders json with only the one role in this group' 

        end
      end

      context 'layer' do
        let(:group) { groups(:bottom_layer_one) }

        context 'with layer and below full' do
          before { sign_in(@bl_leader) }

          it 'loads people in layer when no types given' 


          it 'loads selected roles of a group when types given' 


          it 'does not load pending person add requests' 


          context 'json' do
            render_views

            it 'renders json with only the one role in this group' 

          end
        end
      end

      context 'deep' do
        let(:group) { groups(:top_layer) }

        it 'loads people in subtree when no types are given' 


        it 'loads selected roles of a group when types given' 


        context 'json' do
          render_views

          it 'renders json with only the one role in this group' 

        end
      end

      context 'filter_id' do
        let(:group) { groups(:top_layer) }

        it 'loads selected roles of a group' 

      end
    end

    context 'PUT update' do
      let(:person) { people(:bottom_member) }
      let(:group) { person.groups.first }

      it 'as admin updates email with password' 


      context 'as bottom leader' do
        before { sign_in(Fabricate(Group::BottomLayer::Leader.sti_name, group: group).person) }

        it 'updates email for person in one group' 


        it 'does not update email for person in multiple groups' 


        it 'does not update password for other person' 


        it 'create new phone numbers' 


        it 'updates existing phone numbers' 


        it 'updates existing phone numbers in other language' 


        it 'destroys existing phone numbers' 


        it 'destroys existing phone numbers when number is empty' 


        it 'create, update and destroys social accounts' 


        it 'create, update and destroys additional emails' 


        it 'create, update and destroys people relations' 

      end
    end

    describe 'GET #show' do
      let(:gl) { qualification_kinds(:gl) }
      let(:sl) { qualification_kinds(:sl) }

      it 'generates pdf labels' 


      it 'exports csv file' 


      context 'tags' do
        before do
          top_leader.tags.create!(name: 'fruit:banana')
          top_leader.tags.create!(name: 'pizza')
        end

        it 'preloads and assigns grouped tags' 

      end

      context 'qualifications' do
        before do
          @ql_gl = Fabricate(:qualification, person: top_leader, qualification_kind: gl, start_at: Time.zone.now)
          @ql_sl = Fabricate(:qualification, person: top_leader, qualification_kind: sl, start_at: Time.zone.now)
        end

        it 'preloads data for asides, ordered by finish_at' 

      end

      context 'add requests' do
        let(:person) { people(:top_leader) }

        it 'loads requests' 


        it 'shows flash status accepted' 


        it 'shows flash status rejected' 

      end

    end

    describe 'POST #send_password_instructions' do
      let(:person) { people(:bottom_member) }

      it 'does not send instructions for self' 


      it 'sends password instructions' 

    end

    describe 'PUT #primary_group' do
      it 'sets primary group' 

    end

  end

  context 'json' do
    render_views

    before do
      @public_number = Fabricate(:phone_number, contactable: top_leader, public: true)
      @private_number = Fabricate(:phone_number, contactable: top_leader, public: false)
      Fabricate(Group::BottomGroup::Member.name.to_sym, group: groups(:bottom_group_two_one), person: top_leader)
    end

    context 'as self' do
      before { sign_in(top_leader) }

      it 'GET index contains current role and all data' 


      it 'GET show contains all roles and all data' 

    end

    context 'with contact data' do

      let(:user) { Fabricate(Group::BottomLayer::Leader.name.to_sym, group: groups(:bottom_layer_one)).person }
      before { sign_in(user) }

      it 'GET index contains only current roles and public data' 


      it 'GET show contains only current roles and public data' 

    end
  end

  context 'as reader' do

    before { sign_in(user) }

    let(:user) { Fabricate(Group::TopGroup::LocalSecretary.name, group: groups(:top_group)).person }

    context 'add requests' do
      let(:person) { people(:top_leader) }

      it 'does not load requests' 

    end

  end

  context 'as api user' do

    describe 'GET #show' do
      it 'redirects when token is nil' 


      it 'redirects when token is invalid' 


      it 'shows page when token is valid' 


      it 'shows page when headers are valid' 

    end

  end

  context 'DELETE #destroy' do

    let(:member) { people(:bottom_member) }
    let(:admin) { people(:top_leader) }

    describe 'as admin user' do
      before { sign_in(admin) }

      it 'can delete person' 


      it 'deletes person' 

    end

    describe 'as normal user' do
      before { sign_in(member) }

      it 'fails without permissions' 

    end
  end

  context 'households' do
    let(:member) { people(:bottom_member) }
    before { sign_in(top_leader) }

    it 'POST#update creates household' 


    it 'POST#update clears household' 

  end
end

