def build_path(path_redir)
  Rails.application.routes.recognize_path(path_redir, method: :get)
end

def post_debug?(page_valid)
  ENV['w3c_debug'] && !page_valid.message.nil?
end

def run_test (test_data)
  if ENV['w3c_validate']
    test = eval(test_data).to_h
    description = "#{test[:controller].camelize}Controller"
    describe description.safe_constantize, type: :controller do
      render_views
      describe "##{test[:action]}" do
        it "should #{test[:test_name]}" 

      end
    end
  end
end

eval(IO.read('spec/fixtures/w3c_data.rb')).each do |test|
  eval(%Q|
        run_test '#{test}'
    |)
end

