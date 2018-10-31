require 'spec_helper'

describe 'groups/edit.html.haml' do
  include Devise::Test::ControllerHelpers

  describe '"Share with group lock" setting' do
    let(:root_owner) { create(:user) }
    let(:root_group) { create(:group) }

    before do
      root_group.add_owner(root_owner)
    end

    shared_examples_for '"Share with group lock" setting' do |checkbox_options|
      it 'should have the correct label, help text, and checkbox options' 

    end

    context 'for a root group' do
      let(:test_group) { root_group }
      let(:test_user) { root_owner }

      it_behaves_like '"Share with group lock" setting', { disabled: false, checked: false }
    end

    context 'for a subgroup', :nested_groups do
      let!(:subgroup) { create(:group, parent: root_group) }
      let(:sub_owner) { create(:user) }
      let(:test_group) { subgroup }

      context 'when the root_group has "Share with group lock" disabled' do
        context 'when the subgroup has "Share with group lock" disabled' do
          context 'as the root_owner' do
            let(:test_user) { root_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: false }
          end

          context 'as the sub_owner' do
            let(:test_user) { sub_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: false }
          end
        end

        context 'when the subgroup has "Share with group lock" enabled' do
          before do
            subgroup.update_column(:share_with_group_lock, true)
          end

          context 'as the root_owner' do
            let(:test_user) { root_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: true }
          end

          context 'as the sub_owner' do
            let(:test_user) { sub_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: true }
          end
        end
      end

      context 'when the root_group has "Share with group lock" enabled' do
        before do
          root_group.update_column(:share_with_group_lock, true)
        end

        context 'when the subgroup has "Share with group lock" disabled (parent overridden)' do
          context 'as the root_owner' do
            let(:test_user) { root_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: false }
          end

          context 'as the sub_owner' do
            let(:test_user) { sub_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: false }
          end
        end

        context 'when the subgroup has "Share with group lock" enabled (same as parent)' do
          before do
            subgroup.update_column(:share_with_group_lock, true)
          end

          context 'as the root_owner' do
            let(:test_user) { root_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: false, checked: true }
          end

          context 'as the sub_owner' do
            let(:test_user) { sub_owner }

            it_behaves_like '"Share with group lock" setting', { disabled: true, checked: true }
          end
        end
      end
    end
  end
end

