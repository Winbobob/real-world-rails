# -*- coding: utf-8 -*-
require 'spec_helper'
require 'rspec_api_documentation/dsl'

describe RspecApiDocumentation::Views::ApiBlueprintIndex do
  let(:reporter) { RSpec::Core::Reporter.new(RSpec::Core::Configuration.new) }
  let(:post_group) { RSpec::Core::ExampleGroup.resource("Posts") }
  let(:comment_group) { RSpec::Core::ExampleGroup.resource("Comments") }
  let(:rspec_example_post_get) do
    post_group.route "/posts/:id{?option=:option}", "Single Post" do
      parameter :id, "The id", required: true, type: "string", example: "1"
      parameter :option

      get("/posts/{id}") do
        example_request 'Gets a post' do
          explanation "Gets a post given an id"
        end

        example_request 'Returns an error' do
          explanation "You have to provide an id"
        end
      end
    end
  end

  let(:rspec_example_post_delete) do
    post_group.route "/posts/:id", "Single Post" do
      parameter :id, "The id", required: true, type: "string", example: "1"

      delete("/posts/:id") do
        example_request 'Deletes a post' do
          do_request
        end
      end
    end
  end

  let(:rspec_example_post_update) do
    post_group.route "/posts/:id", "Single Post" do
      parameter :id, "The id", required: true, type: "string", example: "1"
      attribute :name, "Order name 1", required: true
      attribute :name, "Order name 2", required: true

      put("/posts/:id") do
        example_request 'Updates a post' do
          do_request
        end
      end
    end
  end


  let(:rspec_example_posts) do
    post_group.route "/posts", "Posts Collection" do
      attribute :description, required: false

      get("/posts") do
        example_request 'Get all posts' do
        end
      end
    end
  end

  let(:rspec_example_comments) do
    comment_group.route "/comments", "Comments Collection" do
      get("/comments") do
        example_request 'Get all comments' do
        end
      end
    end
  end
  let(:index) do
    RspecApiDocumentation::Index.new.tap do |index|
      index.examples << RspecApiDocumentation::Example.new(rspec_example_post_get, config)
      index.examples << RspecApiDocumentation::Example.new(rspec_example_post_delete, config)
      index.examples << RspecApiDocumentation::Example.new(rspec_example_post_update, config)
      index.examples << RspecApiDocumentation::Example.new(rspec_example_posts, config)
      index.examples << RspecApiDocumentation::Example.new(rspec_example_comments, config)
    end
  end
  let(:config) { RspecApiDocumentation::Configuration.new }

  subject { described_class.new(index, config) }

  describe '#sections' do
    it 'returns sections grouped' 


    describe "#routes" do
      let(:sections) { subject.sections }

      it "returns routes grouped" 

    end
  end
end

