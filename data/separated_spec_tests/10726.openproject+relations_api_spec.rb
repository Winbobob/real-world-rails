#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe  'API v3 Relation resource', type: :request, content_type: :json do
  include API::V3::Utilities::PathHelper

  let(:user) { FactoryBot.create :admin }

  let!(:from) { FactoryBot.create :work_package }
  let!(:to) { FactoryBot.create :work_package }

  let(:type) { "follows" }
  let(:description) { "This first" }
  let(:delay) { 3 }

  let(:params) do
    {
      _links: {
        from: {
          href: "/api/v3/work_packages/#{from.id}"
        },
        to: {
          href: "/api/v3/work_packages/#{to.id}"
        }
      },
      type: type,
      description: description,
      delay: delay
    }
  end
  let(:relation) do
    FactoryBot.create :relation,
                       from: from,
                       to: to,
                       relation_type: type,
                       description: description,
                       delay: delay
  end

  before do
    login_as user
  end

  describe "creating a relation" do
    shared_examples_for 'creates the relation' do
      it 'creates the relation correctly' 

    end

    let(:setup) {}
    before do
      # reflexive relations
      expect(Relation.count).to eq 2

      setup

      header "Content-Type", "application/json"
      post "/api/v3/work_packages/#{from.id}/relations", params.to_json
    end

    it 'should return 201 (created)' 


    it 'should have created a new relation' 


    it_behaves_like 'creates the relation'

    context 'relation that would create a circular scheduling dependency' do
      let(:from_child) do
        FactoryBot.create(:work_package, parent: from)
      end
      let(:to_child) do
        FactoryBot.create(:work_package, parent: to)
      end
      let(:children_follows_relation) do
        FactoryBot.create :relation,
                           from: to_child,
                           to: from_child,
                           relation_type: Relation::TYPE_FOLLOWS
      end
      let(:relation_type) { Relation::TYPE_FOLLOWS }
      let(:setup) do
        children_follows_relation
      end

      it 'responds with error' 


      it 'states the reason for the error' 

    end

    context 'follows relation within siblings' do
      let(:sibling) do
        FactoryBot.create(:work_package)
      end
      let(:other_sibling) do
        FactoryBot.create(:work_package)
      end
      let(:parent) do
        wp = FactoryBot.create(:work_package)

        wp.children = [sibling, from, to, other_sibling]
      end
      let(:existing_follows) do
        FactoryBot.create(:relation, relation_type: 'follows', from: to, to: sibling)
        FactoryBot.create(:relation, relation_type: 'follows', from: other_sibling, to: from)
      end

      let(:setup) do
        parent
        existing_follows
      end

      it_behaves_like 'creates the relation'
    end

    context 'follows relation to sibling\'s child' do
      let(:sibling) do
        FactoryBot.create(:work_package)
      end
      let(:sibling_child) do
        FactoryBot.create(:work_package, parent: sibling)
      end
      let(:parent) do
        wp = FactoryBot.create(:work_package)

        wp.children = [sibling, from, to]
      end
      let(:existing_follows) do
        FactoryBot.create(:relation, relation_type: 'follows', from: to, to: sibling_child)
      end

      let(:setup) do
        parent
        existing_follows
      end

      it_behaves_like 'creates the relation'
    end
  end

  describe "updating a relation" do
    let(:new_description) { "This is another description" }
    let(:new_delay) { 42 }

    let(:update) do
      {
        description: new_description,
        delay: new_delay
      }
    end

    before do
      relation

      header "Content-Type", "application/json"
      patch "/api/v3/relations/#{relation.id}", update.to_json
    end

    it "should return 200 (ok)" 


    it "updates the relation's description" 


    it "updates the relation's delay" 


    it "should return the updated relation" 


    context "with invalid type" do
      let(:update) do
        {
          type: "foobar"
        }
      end

      it "should return 422" 


      it "should indicate an error with the type attribute" 

    end

    context "with trying to change an immutable attribute" do
      let(:other_wp) { FactoryBot.create :work_package }

      let(:update) do
        {
          _links: {
            from: {
              href: "/api/v3/work_packages/#{other_wp.id}"
            }
          }
        }
      end

      it "should return 422" 


      it "should indicate an error with the `from` attribute" 


      it "should let the user know the attribute is read-only" 

    end
  end

  describe "permissions" do
    let(:user) { FactoryBot.create :user }

    let(:permissions) { %i(view_work_packages manage_work_package_relations) }

    let(:role) do
      FactoryBot.create :existing_role, permissions: permissions
    end

    let(:project) { FactoryBot.create :project }

    let!(:from) { FactoryBot.create :work_package, project: project }
    let!(:to) { FactoryBot.create :work_package, project: project }

    before do
      project.add_member! user, role

      header "Content-Type", "application/json"
      post "/api/v3/work_packages/#{from.id}/relations", params.to_json
    end

    context "with the required permissions" do
      it "works" 

    end

    context "without manage_work_package_relations" do
      let(:permissions) { [:view_work_packages] }

      it "is forbidden" 

    end

    ##
    # This one is expected to fail (422) because the `to` work package
    # is in another project for which the user does not have permission to
    # view work packages.
    context "without manage_work_package_relations" do
      let!(:to) { FactoryBot.create :work_package }

      it "should return 422" 


      it "should indicate an error with the `to` attribute" 


      it "should have a localized error message" 

    end
  end

  describe "deleting a relation" do
    before do
      relation

      delete api_v3_paths.relation(relation.id)
    end

    it "should return 204 and destroy the relation" 

  end

  describe 'GET /api/v3/relations?[filter]' do
    let(:user) { FactoryBot.create(:user) }
    let(:role) { FactoryBot.create(:role, permissions: [:view_work_packages]) }
    let(:member_project_to) do
      FactoryBot.build(:member,
                        project: to.project,
                        user: user,
                        roles: [role])
    end

    let(:member_project_from) do
      FactoryBot.build(:member,
                        project: from.project,
                        user: user,
                        roles: [role])
    end
    let(:invisible_relation) do
      invisible_wp = FactoryBot.create(:work_package)

      FactoryBot.create :relation,
                         from: from,
                         to: invisible_wp
    end
    let(:other_visible_work_package) do
      FactoryBot.create(:work_package,
                         project: to.project,
                         type: to.type)
    end
    let(:other_visible_relation) do
      FactoryBot.create :relation,
                         from: to,
                         to: other_visible_work_package
    end

    let(:members) { [member_project_to, member_project_from] }
    let(:filter) do
      [{ involved: { operator: '=', values: [from.id.to_s] } }]
    end

    before do
      members.each(&:save!)
      relation
      invisible_relation
      other_visible_relation

      get "#{api_v3_paths.relations}?filters=#{CGI::escape(JSON::dump(filter))}"
    end

    it 'returns 200' 


    it 'returns the visible relation (and only the visible one) satisfying the filter' 

  end
end

