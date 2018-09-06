require 'rails_helper'

RSpec.describe "template rendering", :type => :controller do
  context "without render_views" do
    context "with the standard renderers" do
      controller do
        def index
          render :template => 'foo', :layout => false
        end
      end

      it "renders the 'foo' template" 


      it "renders an empty string" 

    end

    context "with a String path prepended to the view path" do
      controller do
        def index
          prepend_view_path('app/views/some_templates')

          render :template => 'bar', :layout => false
        end
      end

      it "renders the 'bar' template" 


      it "renders an empty string" 

    end

    context "with a custom renderer prepended to the view path" do
      controller do
        def index
          prepend_view_path(MyResolver.new)

          render :template => 'baz', :layout => false
        end
      end

      it "renders the 'baz' template" 


      it "renders an empty string" 

    end
  end

  context "with render_views enabled" do
    render_views

    context "with the standard renderers" do
      controller do
        def index
          render :template => 'foo', :layout => false
        end
      end

      it "renders the 'foo' template" 


      it "renders the contents of the template" 

    end

    context "with a String path prepended to the view path" do
      controller do
        def index
          prepend_view_path('app/views/some_templates')

          render :template => 'bar', :layout => false
        end
      end

      it "renders the 'bar' template" 


      it "renders the contents of the template" 

    end

    context "with a custom renderer prepended to the view path" do
      controller do
        def index
          prepend_view_path(MyResolver.new)

          render :template => 'baz', :layout => false
        end
      end

      it "renders the 'baz' template" 


      it "renders the contents of the template" 

    end
  end

  class MyResolver < ActionView::Resolver
  private

    def find_templates(name, prefix = nil, partial = false, details = {}, key = nil, locals = [])
      name.prepend("_") if partial
      path = [prefix, name].join("/")
      template = find_template(name, path)

      [template]
    end

    def find_template(name, path)
      ActionView::Template.new(
        "",
        name,
        lambda { |_template| %("Dynamic template with path '#{_template.virtual_path}'") },
        :virtual_path => path,
        :format => :html
      )
    end
  end
end

