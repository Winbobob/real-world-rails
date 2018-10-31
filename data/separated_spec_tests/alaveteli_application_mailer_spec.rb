# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe ApplicationMailer do

  context 'when using plugins' do

    def set_base_views
      ApplicationMailer.class_eval do
        @previous_view_paths = self.view_paths.dup
        self.view_paths = [File.join(Rails.root, 'spec', 'fixtures', 'theme_views', 'core')]
      end
    end

    def add_mail_methods(method_names)
      method_names.each{ |method_name| ApplicationMailer.send(:define_method, method_name){ mail } }
    end

    def remove_mail_methods(method_names)
      method_names.each do |method_name|
        if ApplicationMailer.respond_to?(method_name)
          ApplicationMailer.send(:remove_method, method_name)
        end
      end
    end

    def prepend_theme_views(theme_name)
      ApplicationMailer.class_eval do
        prepend_view_path File.join(Rails.root, 'spec', 'fixtures', 'theme_views', theme_name)
      end
    end

    def append_theme_views(theme_name)
      ApplicationMailer.class_eval do
        append_view_path File.join(Rails.root, 'spec', 'fixtures', 'theme_views', theme_name)
      end
    end

    def reset_views
      ApplicationMailer.class_eval do
        self.view_paths = @previous_view_paths
      end
    end

    def create_multipart_method(method_name)
      ApplicationMailer.send(:define_method, method_name) do
        attachments['original.eml'] = 'xxx'
        mail
      end
    end

    before do
      set_base_views
      add_mail_methods(['simple', 'theme_only', 'core_only', 'neither'])
    end

    describe 'when a plugin prepends its mail templates to the view paths' do

      it 'should render a theme template in preference to a core template' 


      it 'should render the template provided by the theme if no template is available in core' 


      it 'should render the template provided by core if there is no theme template' 


      it 'should raise a missing template error if the template is in
          neither core nor theme' do
        prepend_theme_views('theme_one')
        @mail = ApplicationMailer.neither
        expect{ @mail.body }.to raise_error(ActionView::MissingTemplate)
      end

      it 'should render a multipart email using a theme template' 


      it 'should render a multipart email using a core template' 


    end

    describe 'when a plugin appends its mail templates to the view paths' do

      it 'should render a core template in preference to a theme template' 


      it 'should render the template provided by the theme if no template is available in core' 


      it 'should render the template provided by core if there is no theme template' 


      it 'should raise a missing template error if the template is in
          neither core nor theme' do
        append_theme_views('theme_one')
        @mail = ApplicationMailer.neither
        expect{ @mail.body }.to raise_error(ActionView::MissingTemplate)
      end

      it 'should render a multipart email using a core template' 


      it 'should render a multipart email using a theme template' 


    end

    after do
      reset_views
      remove_mail_methods(['simple', 'theme_only', 'core_only', 'neither', 'multipart'])
    end
  end

end

