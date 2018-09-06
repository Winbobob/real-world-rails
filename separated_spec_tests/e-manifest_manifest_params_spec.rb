require 'rails_helper'

describe ManifestParams do
  before do
    class MyTestController < ApplicationController
      include ManifestParams
      def params
        { manifest: { foo: 'bar', color: '' } }
      end
    end
  end

  it 'filters out empty manifest params' 

end

