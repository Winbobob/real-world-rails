require "spec_helper"
require "rspec_api_documentation/writers/combined_text_writer"

describe RspecApiDocumentation::Writers::CombinedTextExample do
  let(:metadata) { {} }
  let(:rspec_example) { double(:resource_name => "Foo Bar", :description => "ABCDEFG", :metadata => metadata) }
  let(:example) { RspecApiDocumentation::Writers::CombinedTextExample.new(rspec_example) }

  it "should format its resource name" 


  it "should format its description" 


  context "given parameters" do
    let(:metadata) {{
      :parameters => [
        { :name => "foo", :description => "Foo!" },
        { :name => "bar", :description => "Bar!" }
      ]
    }}

    it "should format its parameters" 

  end

  it "renders nothing if there are no parameters" 


  context "when there are requests" do
    let(:requests) {[
      {
        :request_method => "GET",
        :request_path => "/greetings",
        :request_headers => { "Header" => "value" },
        :request_query_parameters => { "foo" => "bar", "baz" => "quux" },
        :response_status => 200,
        :response_status_text => "OK",
        :response_headers => { "Header" => "value", "Foo" => "bar" },
        :response_body => "body"
      },
      {
        :request_method => "POST",
        :request_path => "/greetings",
        :request_body => "body",
        :response_status => 404,
        :response_status_text => "Not Found",
        :response_headers => { "Header" => "value" },
        :response_body => "body"
      },
      {
        :request_method => "DELETE",
        :request_path => "/greetings/1",
        :response_status => 200,
        :response_status_text => "OK",
        :response_headers => { "Header" => "value" },
      },
    ]}
    let(:metadata) {{ :requests => requests }}

    it "exposes the requests" 

  end

  it "returns the empty array if there are no requests" 

end

