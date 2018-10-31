require 'rails_helper'

describe 'pool drainer' do
  let(:pool) do
    ActiveRecord::Base.connection_pool
  end

  it 'can correctly drain the connection pool' 


  it 'can drain with idle time setting' 


end

