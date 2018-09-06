require_relative '../spec_helper'

module AwsSdkCodeGenerator
  describe SharedExample do

    let(:dir) { File.dirname(__FILE__) }
    let(:example_path) { File.join(dir, '..', 'fixtures', 'shared_examples', 'examples.json') }
    let(:example_file) { File.open(example_path, 'rb') {|file| JSON.load(file.read)} }
    let(:examples) {example_file['examples']}

    let(:api_path) { File.join(dir, '..', 'fixtures', 'shared_examples', 'api.json') }
    let(:s3_api) { File.open(api_path, 'rb') {|file| JSON.load(file.read)} }

    def load_example_input(operation_name)
      example = examples[operation_name][0]
      operation = s3_api['operations'][operation_name]
      method_name = Underscore.underscore(operation_name)
      input_str = SharedExample.new(
        example["input"], method_name, operation, s3_api, example["comments"]["input"]).to_str_input
    end

    def load_example_output(operation_name)
      example = examples[operation_name][0]
      operation = s3_api['operations'][operation_name]
      method_name = Underscore.underscore(operation_name)
      output_str = SharedExample.new(
        example["output"], method_name, operation, s3_api, example["comments"]["output"]).to_str_output
    end

    it 'supports nested structures' 


    it 'supports lists of structures' 


    it 'supports lists of scalars with enums' 


    it 'supports comments on structure members (output)' 


    it 'supports comments on list members' 


    it 'supports comments on map members' 


    it 'differentiates between maps and structures' 


    it 'supports timestamps (output)' 


    it 'supports escaped quotes' 


  end
end

