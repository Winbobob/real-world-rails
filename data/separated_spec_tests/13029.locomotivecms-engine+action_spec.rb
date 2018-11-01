describe 'A site with a javascript action' do

  before { create_full_site }

  describe 'create a content entry in javascript' do

    before do
      javascript = <<-JS
        var entry = createEntry('messages', { name: 'John', message: 'Hello world' });
        setProp("message", entry.name + ' sends ' + entry.message);
      JS
      @site.pages.create(parent: @site.pages.root.first, title: 'Action call', slug: 'action', raw_template: %{<html><body>{% action "create message" %}#{javascript}{% endaction %}{{ message }}</body></html>})
    end

    it 'executes the action' 


  end

  describe 'update a content entry in javascript' do

    let(:content_type) { @site.content_types.where(slug: 'messages').first }

    before do
      content_type.entries.create(_slug: 'john', name: 'John', message: 'Hello world')

      javascript = <<-JS
        var entry = updateEntry('messages', 'john', { message: 'Hello world!' });
        setProp("message", entry.name + ' sends ' + entry.message);
      JS
      @site.pages.create(parent: @site.pages.root.first, title: 'Action call', slug: 'action', raw_template: %{<html><body>{% action "create message" %}#{javascript}{% endaction %}{{ message }}</body></html>})
    end

    it 'executes the action' 


  end

end
