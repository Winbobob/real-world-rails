# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

RSpec.describe Outcomes::Import do
  class TestImporter
    include Outcomes::Import

    def initialize(context)
      @context = context
    end

    def current_import_id
      outcome_import_id
    end

    def new_import
      @outcome_import_id = nil
      outcome_import_id
    end

    attr_reader :context
  end

  let_once(:context) { account_model }
  let_once(:course) { course_model(account: context) }
  let_once(:other_context) { account_model }
  let_once(:parent1) { outcome_group_model(context: context, vendor_guid: 'parent1') }
  let_once(:parent2) { outcome_group_model(context: context, vendor_guid: 'parent2') }
  let_once(:outcome_vendor_guid) { 'imanoutcome' }
  let_once(:group_vendor_guid) { 'imagroup' }
  let(:group_attributes) do
    {
      title: "i'm a group",
      description: "really i'm a group",
      vendor_guid: group_vendor_guid,
      workflow_state: 'active',
    }
  end
  let(:outcome_attributes) do
    {
      title: "i'm an outcome",
      description: "really i'm an outcome",
      display_name: 'display an outcome',
      vendor_guid: outcome_vendor_guid,
      workflow_state: 'active',
      calculation_method: 'n_mastery',
      calculation_int: 3
    }
  end
  let(:importer) { TestImporter.new(context) }

  # on export, nil database values are converted to ''
  def simulate_export(attributes)
    attributes.transform_values { |v| v.nil? ? '' : v }
  end

  describe '#import_object' do
    it 'calls #import_group for a group' 


    it 'calls #import_outcome for an outcome' 


    it 'raises an error for anything else' 

  end

  describe '#import_group' do
    let_once(:existing_group) { outcome_group_model(context: context, vendor_guid: group_vendor_guid) }

    context 'with magic vendor_guid' do
      let(:magic_guid) do
        "canvas_outcome_group:#{existing_group.id}"
      end

      it 'fails if group not present with that id' 


      it '"imports" group if matching group not in correct context' 


      it 'updates "imported" group on further imports instead of re-importing' 


      it 'updates description of group in correct context' 

    end

    context 'with vendor_guid' do
      it 'updates if group in current context' 


      it 'creates in current context if group not found' 


      it 'uses the right vendor_guid clause' 


      it 'creates new group if matching group not in correct context' 

    end

    it 'updates attributes' 


    it 'fails if outcome group has already appeared in import' 


    context 'with parents' do
      before do
        [parent1, parent2].each do |p|
          importer.import_group(**group_attributes, vendor_guid: p.vendor_guid)
        end
      end

      it 'assigns correct parent' 


      it 'assigns to root outcome group if no parent specified' 


      it 'fails if parents not found in file' 


      it 'fails if parents not found' 


      it 'reassigns parents of existing group' 

    end

    it 'destroys outcome group if workflow state deleted' 

  end

  describe '#import_outcome' do
    let_once(:existing_outcome) do
      outcome_model(context: context, vendor_guid: outcome_vendor_guid, display_name: '')
    end

    context 'with magic vendor_guid' do
      let(:magic_guid) do
        "canvas_outcome:#{existing_outcome.id}"
      end

      it 'fails if outcome not present with that id' 


      it 'fails if matching outcome not in visible context' 


      it 'updates description if outcome in current context' 


      context 'importing outcome into visible context' do
        let(:importer) { TestImporter.new(course) }

        it 'fails updating non-vendor guid attributes' 


        it 'allows magic guid to reference but not update outcome' 

      end
    end

    context 'with vendor_guid' do
      it 'fails if matching outcome not in visible context' 


      it 'updates if outcome in current context' 


      it 'uses the right vendor_guid clause' 


      it 'imports if outcome in visible context and unchanged' 


      it 'creates in current context if outcome not found' 

    end

    it 'updates attributes' 


    it 'fails if outcome has already appeared in import' 


    context 'with parents' do
      before do
        [parent1, parent2].each do |p|
          importer.import_group(**group_attributes, vendor_guid: p.vendor_guid)
        end
      end

      it 'assigns correct parents' 


      it 'reassigns parent when resurrected' 


      it 'assigns to root outcome group if no parent specified' 


      it 'fails if parents not found' 


      it 'does not find parents from another context' 


      it 'reassigns parents of existing outcome' 


      context 'with outcomes from other contexts' do
        let(:parent_context) { account_model }

        before do
          context.update! parent_account: parent_context
          existing_outcome.update! context: parent_context
        end

        it 'does not assign parents when attributes are changed' 


        it 'assigns parents for outcome in another context if attributes unchanged' 


        it 'can link an outcome with nil attributes to a different context' 


        context 'with global context' do
          let(:parent_context) { nil }

          it 'does not assign parents when attributes are changed' 


          it 'assigns parents if attributes are unchanged' 

        end
      end
    end

    it 'calls destroy on content tag if workflow state is deleted' 

  end
end

