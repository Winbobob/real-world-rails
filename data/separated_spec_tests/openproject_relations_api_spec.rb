#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
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
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe ::API::V3::Relations::RelationRepresenter, type: :request do
  include API::V3::Utilities::PathHelper

  let(:user) { FactoryGirl.create :admin }

  let!(:from) { FactoryGirl.create :work_package }
  let!(:to) { FactoryGirl.create :work_package }

  let(:type) { "precedes" }
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
    FactoryGirl.create :relation,
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
    before do
      expect(Relation.count).to eq 0

      post "/api/v3/work_packages/#{from.id}/relations",
           params: params.to_json,
           headers: { "Content-Type": "application/json" }
    end

    it 'should return 201 (created)' 


    it 'should have created a new relation' 


    it 'should have created the relation correctly' 

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

      patch "/api/v3/relations/#{relation.id}",
            params: update.to_json,
            headers: { "Content-Type": "application/json" }
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
      let(:other_wp) { FactoryGirl.create :work_package }

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
    let(:user) { FactoryGirl.create :user }

    let(:permissions) { %i(view_work_packages manage_work_package_relations) }

    let(:role) do
      FactoryGirl.create :existing_role, permissions: permissions
    end

    let(:project) { FactoryGirl.create :project }

    let!(:from) { FactoryGirl.create :work_package, project: project }
    let!(:to) { FactoryGirl.create :work_package, project: project }

    before do
      project.add_member! user, role

      post "/api/v3/work_packages/#{from.id}/relations",
           params: params.to_json,
           headers: { "Content-Type": "application/json" }
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
      let!(:to) { FactoryGirl.create :work_package }

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
    let(:user) { FactoryGirl.create(:user) }
    let(:role) { FactoryGirl.create(:role, permissions: [:view_work_packages]) }
    let(:member_project_to) do
      FactoryGirl.build(:member,
                        project: to.project,
                        user: user,
                        roles: [role])
    end

    let(:member_project_from) do
      FactoryGirl.build(:member,
                        project: from.project,
                        user: user,
                        roles: [role])
    end
    let(:invisible_relation) do
      invisible_wp = FactoryGirl.create(:work_package)

      FactoryGirl.create :relation,
                         from: from,
                         to: invisible_wp
    end
    let(:other_visible_work_package) do
      FactoryGirl.create(:work_package,
                         project: to.project,
                         type: to.type)
    end
    let(:other_visible_relation) do
      FactoryGirl.create :relation,
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

