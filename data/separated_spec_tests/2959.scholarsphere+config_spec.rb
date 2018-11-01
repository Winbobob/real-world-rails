# frozen_string_literal: true

require 'rails_helper'

describe Scholarsphere::Config do
  describe '::check' do
    context 'with our current configuration files' do
      it 'checks the contents of our production configuration files' 

    end

    context 'with a sample config file' do
      before { allow(Dir).to receive(:glob).and_return([File.join(fixture_path, 'application.yml')]) }

      it 'raises an error' 

    end

    context 'with another sample config file' do
      before { allow(Dir).to receive(:glob).and_return([File.join(fixture_path, 'application_more.yml')]) }

      it 'allows for additional non required keys' 

    end
  end
end

