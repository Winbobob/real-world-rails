# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::NavigationHelper do
  let(:alchemy_module) do
    {
      'name' => 'dashboard',
      'engine_name' => 'alchemy',
      'navigation' => {
        'name' => 'modules.dashboard',
        'controller' => 'alchemy/admin/dashboard',
        'action' => 'index',
        'icon' => 'dashboard'
      }
    }
  end

  let(:module_with_subnavigation) do
    {
      'name' => 'library',
      'engine_name' => 'alchemy',
      'navigation' => {
        'name' => 'modules.library',
        'controller' => 'alchemy/admin/pictures',
        'action' => 'index',
        'sub_navigation' => [{
          'name' => 'modules.pictures',
          'controller' => 'alchemy/admin/pictures',
          'action' => 'index'
        }, {
          'name' => 'modules.files',
          'controller' => 'alchemy/admin/attachments',
          'action' => 'index'
        }]
      }
    }
  end

  let(:event_module) do
    {
      'navigation' => {
        'controller' => '/admin/events',
        'action' => 'index',
        'sub_navigation' => [{
          'controller' => '/admin/events',
          'action' => 'index'
        }]
      }
    }
  end

  let(:event_module_with_params) do
    {
      'navigation' => {
        'controller' => '/admin/events',
        'action' => 'index',
        'params' => {
          'key' => 'value'
        },
        'sub_navigation' => [{
          'controller' => '/admin/events',
          'action' => 'index',
          'params' => {
            'key' => 'value',
            'key2' => 'value2'
          }
       }]
      }
    }
  end

  let(:navigation) { alchemy_module['navigation'] }

  describe '#alchemy_main_navigation_entry' do
    before do
      allow(helper).to receive(:url_for_module).and_return('')
      allow(Alchemy).to receive(:t).and_return(alchemy_module['name'])
    end

    context "with permission" do
      before do
        allow(helper).to receive(:can?).and_return(true)
      end

      it "renders the main navigation entry partial" 


      context "when module has sub navigation" do
        let(:alchemy_module) do
          module_with_subnavigation
        end

        before do
          allow(helper).to receive(:module_definition_for) do
            alchemy_module
          end
        end

        it 'includes the sub navigation' 

      end
    end

    context "without permission" do
      before do
        allow(helper).to receive(:can?).and_return(false)
      end

      it "returns empty string" 

    end
  end

  describe '#navigate_module' do
    it "returns array with symbolized action and controller name" 


    context "when controller name has a leading slash" do
      let(:navigation) do
        {
          'action' => 'index',
          'controller' => '/admin/pictures'
        }
      end

      it "removes leading slash" 

    end
  end

  describe '#main_navigation_css_classes' do
    it "returns string with css classes for main navigation entry" 


    context "with active entry" do
      before do
        allow(helper).to receive(:params).and_return({
          controller: 'alchemy/admin/dashboard',
          action: 'index'
        })
      end

      it "includes active class" 

    end
  end

  describe '#entry_active?' do
    let(:entry) do
      {'controller' => 'alchemy/admin/dashboard', 'action' => 'index'}
    end

    context "with active entry" do
      before do
        allow(helper).to receive(:params) do
          {
            controller: 'alchemy/admin/dashboard',
            action: 'index'
          }
        end
      end

      it "returns true" 


      context "and with leading slash in controller name" do
        before { entry['controller'] = '/alchemy/admin/dashboard' }

        it "returns true" 

      end

      context "but with action listed in nested_actions key" do
        before do
          entry['action'] = nil
          entry['nested_actions'] = %w(index)
        end

        it "returns true" 

      end
    end

    context "with inactive entry" do
      before do
        expect(helper).to receive(:params) do
          {
            controller: 'alchemy/admin/users',
            action: 'index'
          }
        end
      end

      it "returns false" 

    end
  end

  describe '#url_for_module' do
    context "with module within an engine" do
      it "returns correct url string" 

    end

    context "with module within host app" do
      it "returns correct url string" 


      it "returns correct url string with params" 

    end
  end

  describe '#url_for_module_sub_navigation' do
    let(:current_module) do
      module_with_subnavigation
    end

    let(:navigation) do
      current_module['navigation']['sub_navigation'].first
    end

    subject { helper.url_for_module_sub_navigation(navigation) }

    context 'with module found' do
      before do
        expect(helper).to receive(:module_definition_for).and_return current_module
      end

      context "with module within an engine" do
        it "returns correct url string" 

      end

      context "with module within host app" do
        let(:current_module) { event_module }

        it "returns correct url string" 

      end

      context "with module within host app with params" do
        let(:current_module) { event_module_with_params }

        it "returns correct url string with params" 

      end
    end

    context 'without module found' do
      before do
        expect(helper).to receive(:module_definition_for).and_return nil
      end

      it { is_expected.to be_nil }
    end
  end

  describe "#sorted_alchemy_modules" do
    subject { helper.sorted_alchemy_modules }

    context 'with position attribute on modules' do
      before do
        alchemy_module['position'] = 1
        event_module['position'] = 2
        expect(helper).to receive(:alchemy_modules).and_return [event_module, alchemy_module]
      end

      it "returns sorted alchemy modules" 

    end

    context 'with no position attribute on one module' do
      before do
        event_module['position'] = 2
        expect(helper).to receive(:alchemy_modules).and_return [alchemy_module, event_module]
      end

      it "appends this module at the end" 

    end
  end
end

