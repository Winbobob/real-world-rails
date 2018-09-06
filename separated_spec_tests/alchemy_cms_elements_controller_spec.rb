# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::ElementsController do
    routes { Alchemy::Engine.routes }

    let(:alchemy_page)         { create(:alchemy_page) }
    let(:element)              { create(:alchemy_element, page: alchemy_page) }
    let(:element_in_clipboard) { create(:alchemy_element, page: alchemy_page) }
    let(:clipboard)            { session[:alchemy_clipboard] = {} }

    before { authorize_user(:as_author) }

    describe '#index' do
      let(:alchemy_page) { build_stubbed(:alchemy_page) }

      before do
        expect(Page).to receive(:find).and_return alchemy_page
      end

      context 'with cells' do
        let(:cell) { build_stubbed(:alchemy_cell, page: alchemy_page) }

        before do
          expect(alchemy_page).to receive(:cells).and_return [cell]
        end

        it "groups elements by cell" 

      end

      context 'without cells' do
        before do
          expect(alchemy_page).to receive(:cells).and_return []
        end

        it "assigns page elements" 

      end
    end

    describe '#list' do
      context 'without page_id, but with page_urlname' do
        it "loads page from urlname" 


        describe 'view' do
          render_views

          it "should return a select tag with elements" 

        end
      end

      context 'with page_id' do
        it "loads page from urlname" 

      end
    end

    describe '#order' do
      let(:element_1)   { create(:alchemy_element) }
      let(:element_2)   { create(:alchemy_element, page: page) }
      let(:element_3)   { create(:alchemy_element, page: page) }
      let(:element_ids) { [element_1.id, element_3.id, element_2.id] }
      let(:page)        { element_1.page }

      it "sets new position for given element ids" 


      context 'with missing [:element_ids] param' do
        it 'does not raise any error and silently rejects to order' 

      end

      context "when nested inside parent element" do
        let(:parent) { create(:alchemy_element) }

        it 'touches the cache key of parent element' 


        it 'assigns parent element id to each element' 

      end

      context "untrashing" do
        let(:trashed_element) { create(:alchemy_element) }

        before do
          # Because of a before_create filter it can not be created with a nil position
          # and needs to be trashed here
          trashed_element.trash!
        end

        it "sets a list of trashed element ids" 


        it "sets a new position to the element" 


        context "with new page_id present" do
          let(:page) { create(:alchemy_page) }

          it "should assign the (new) page_id to the element" 

        end

        context "with cell_id present" do
          let(:cell) { create(:alchemy_cell) }

          it "should assign the (new) cell_id to the element" 

        end
      end
    end

    describe '#new' do
      let(:alchemy_page) { build_stubbed(:alchemy_page) }

      before do
        expect(Page).to receive(:find).and_return(alchemy_page)
      end

      it "assign variable for all available element definitions" 


      context "with elements in clipboard" do
        let(:element) { build_stubbed(:alchemy_element) }
        let(:clipboard_items) { [{'id' => element.id.to_s, 'action' => 'copy'}] }

        before { clipboard['elements'] = clipboard_items }

        it "should load all elements from clipboard" 

      end
    end

    describe '#create' do
      describe 'insertion position' do
        before { element }

        it "should insert the element at bottom of list" 


        context "on a page with a setting for insert_elements_at of top" do
          before do
            expect(PageLayout).to receive(:get).at_least(:once).and_return({
              'name' => 'news',
              'elements' => ['news'],
              'insert_elements_at' => 'top'
            })
          end

          it "should insert the element at top of list" 

        end
      end

      context "if page has cells" do
        let(:page) { create(:alchemy_page, :public, do_not_autogenerate: false) }
        let(:cell) { page.cells.first }

        context "not pasting from clipboard" do
          context "and cell name in element name" do
            before do
              expect(PageLayout).to receive(:get).at_least(:once).and_return({
                'name' => 'standard',
                'elements' => ['article'],
                'cells' => ['header']
              })
              expect(Cell).to receive(:definition_for).and_return({
                'name' => 'header',
                'elements' => ['article']
              })
            end

            it "should put the element in the correct cell" 

          end

          context "and no cell name in element name" do
            it "should put the element in the main cell" 

          end
        end

        context "pasting from clipboard" do
          context "with default element insert position" do
            before do
              expect(PageLayout).to receive(:get).at_least(:once).and_return({
                'name' => 'standard',
                'elements' => ['article'],
                'cells' => ['header']
              })
              clipboard['elements'] = [{'id' => element_in_clipboard.id.to_s}]
            end

            context "and cell name in element name" do
              before do
                expect(Cell).to receive(:definition_for).at_least(:once).and_return({
                  'name' => 'header',
                  'elements' => ['article']
                })
              end

              it "should create the element in the correct cell" 


              context "with elements already in cell" do
                before do
                  cell.elements.create(page_id: page.id, name: "article", create_contents_after_create: false)
                end

                it "should set the correct position for the element" 

              end
            end

            context "and no cell name in element name" do
              it "should create the element in the nil cell" 

            end
          end

          context "on a page with a setting for insert_elements_at of top" do
            let!(:alchemy_page)         { create(:alchemy_page, :public, name: 'News') }
            let!(:element_in_clipboard) { create(:alchemy_element, page: alchemy_page, name: 'news') }
            let!(:cell)                 { create(:alchemy_cell, name: 'news', page: alchemy_page) }
            let!(:element)              { create(:alchemy_element, name: 'news', page: alchemy_page, cell: cell) }

            before do
              expect(PageLayout).to receive(:get).at_least(:once).and_return({
                'name' => 'news',
                'elements' => ['news'],
                'insert_elements_at' => 'top',
                'cells' => ['news']
              })
              expect(Cell).to receive(:definition_for).and_return({
                'name' => 'news',
                'elements' => ['news']
              })
              clipboard['elements'] = [{'id' => element_in_clipboard.id.to_s}]
              cell.elements << element
            end

            it "should insert the element at top of list" 

          end
        end
      end

      context "pasting from clipboard" do
        render_views

        before do
          clipboard['elements'] = [{'id' => element_in_clipboard.id.to_s, 'action' => 'cut'}]
        end

        it "should create an element from clipboard" 


        context "and with cut as action parameter" do
          it "should also remove the element id from clipboard" 

        end
      end

      context 'if element could not be saved' do
        subject { post :create, params: {element: {page_id: alchemy_page.id}} }

        before do
          expect_any_instance_of(Element).to receive(:save).and_return false
        end

        it "renders the new template" 

      end
    end

    describe '#find_or_create_cell' do
      before do
        controller.instance_variable_set(:@page, alchemy_page)
      end

      context "with element name and cell name in the params" do
        before do
          expect(Cell).to receive(:definition_for).and_return({
            'name' => 'header',
            'elements' => ['header']
          })
          expect(controller).to receive(:params).and_return({element: {name: 'header#header'}})
        end

        context "with cell not existing" do
          it "should create the cell" 

        end

        context "with the cell already present" do
          before do
            create(:alchemy_cell, page: alchemy_page, name: 'header')
          end

          it "should load the cell" 

        end
      end

      context "with only the element name in the params" do
        before do
          expect(controller).to receive(:params).and_return({element: {name: 'header'}})
        end

        it "should return nil" 

      end

      context 'with cell definition not found' do
        before do
          expect(controller).to receive(:params).and_return({element: {name: 'header#header'}})
          expect(Cell).to receive(:definition_for).and_return nil
        end

        it "raises error" 

      end
    end

    describe '#update' do
      let(:page)    { build_stubbed(:alchemy_page) }
      let(:element) { build_stubbed(:alchemy_element, page: page) }
      let(:contents_parameters) { ActionController::Parameters.new(1 => {ingredient: 'Title'}) }
      let(:element_parameters) { ActionController::Parameters.new(tag_list: 'Tag 1', public: false) }

      before do
        expect(Element).to receive(:find).and_return element
        expect(controller).to receive(:contents_params).and_return(contents_parameters)
      end

      it "updates all contents in element" 


      it "updates the element" 


      context "failed validations" do
        it "displays validation failed notice" 

      end
    end

    describe 'params security' do
      context "contents params" do
        let(:parameters) { ActionController::Parameters.new(contents: {1 => {ingredient: 'Title'}}) }

        specify ":contents is required" do
          expect(controller.params).to receive(:fetch).and_return(parameters)
          controller.send :contents_params
        end

        specify "everything is permitted" do
          expect(controller).to receive(:params).and_return(parameters)
          expect(parameters).to receive(:fetch).and_return(parameters)
          expect(parameters).to receive(:permit!)
          controller.send :contents_params
        end
      end

      context "element params" do
        let(:parameters) { ActionController::Parameters.new(element: {public: true}) }

        before do
          expect(controller).to receive(:params).and_return(parameters)
          expect(parameters).to receive(:fetch).with(:element, {}).and_return(parameters)
        end

        context 'with taggable element' do
          before do
            controller.instance_variable_set(:'@element', mock_model(Element, taggable?: true))
          end

          specify ":tag_list is permitted" do
            expect(parameters).to receive(:permit).with(:tag_list)
            controller.send :element_params
          end
        end

        context 'with not taggable element' do
          before do
            controller.instance_variable_set(:'@element', mock_model(Element, taggable?: false))
          end

          specify ":tag_list is not permitted" do
            expect(parameters).to_not receive(:permit)
            controller.send :element_params
          end
        end
      end
    end

    describe '#trash' do
      subject { delete :trash, params: {id: element.id}, xhr: true }

      let(:element) { build_stubbed(:alchemy_element) }

      before { expect(Element).to receive(:find).and_return element }

      it "trashes the element instead of deleting it" 

    end

    describe '#fold' do
      subject { post :fold, params: {id: element.id}, xhr: true }

      let(:element) { build_stubbed(:alchemy_element) }

      before do
        expect(element).to receive(:save).and_return true
        expect(Element).to receive(:find).and_return element
      end

      context 'if element is folded' do
        before { expect(element).to receive(:folded).and_return true }

        it "sets folded to false." 

      end

      context 'if element is not folded' do
        before { expect(element).to receive(:folded).and_return false }

        it "sets folded to true." 

      end
    end
  end
end

