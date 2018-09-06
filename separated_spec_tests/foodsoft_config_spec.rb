require_relative '../spec_helper'

feature 'admin/configs' do
  let(:name) { Faker::Lorem.words(rand(2..4)).join(' ') }
  let(:email) { Faker::Internet.email }
  let(:admin) { create :admin }

  before { login admin }

  it 'has initial value' 


  it 'can modify a value' 


  it 'keeps config the same without changes' 


  it 'can modify a nested value' 


  def get_full_config
    cfg = FoodsoftConfig.to_hash.deep_dup
    compact_hash_deep!(cfg)
  end

  def compact_hash_deep!(h)
    h.each do |k,v|
      if v.is_a? Hash
        compact_hash_deep!(v)
        v.reject! {|k,v| v.blank?}
      end
    end
    h.reject! {|k,v| v.blank?}
    h
  end
end

