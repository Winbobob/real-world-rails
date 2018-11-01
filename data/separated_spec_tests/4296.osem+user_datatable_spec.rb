# frozen_string_literal: true

require 'spec_helper'

describe UserDatatable do
  subject! do
    described_class.new(view)
  end

  let(:data_cols) do
    [:id, :confirmed_at, :email, :name, :attended, :roles, :view_url, :edit_url, :DT_RowId]
  end
  let(:view) do
    view = double(
      'view',
      params: {
        'draw'    => '1',
        'columns' => {
          '0' => {
            'data'       => 'id',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '1' => {
            'data'       => 'confirmed_at',
            'name'       => '',
            'searchable' => 'false',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '2' => {
            'data'       => 'email',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '3' => {
            'data'       => 'name',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '4' => {
            'data'       => 'attended',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '5' => {
            'data'       => 'roles',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'true',
            'search'     => { 'value' => '', 'regex' => 'false' }
          },
          '6' => {
            'data'       => '',
            'name'       => '',
            'searchable' => 'true',
            'orderable'  => 'false',
            'search'     => { 'value' => '', 'regex' => 'false' }
          }
        },
        'order'  => { '0' => { 'column' => '0', 'dir' => 'asc' } },
        'start'  => '0',
        'length' => '10',
        'search' => { 'value' => '', 'regex' => 'false' },
        '_'      => '1532637360488'
      }.with_indifferent_access
    )
    allow(view).to receive(:admin_user_path) do |arg|
      "/admin/users/#{arg.to_param}"
    end
    allow(view).to receive(:edit_admin_user_path) do |arg|
      "/admin/users/#{arg.to_param}/edit"
    end
    return view
  end

  before do
    allow(AjaxDatatablesRails).to receive(:old_rails?).and_return(true)
  end

  describe 'implements AjaxDatatablesRails::Base' do
    it { is_expected.to respond_to(:view_columns) }
  end

  context 'outputs' do
    let(:user) { User.first }
    let(:output) { subject.as_json }

    it 'recordsTotal' 


    it 'recordsFiltered' 


    it 'data length' 


    it 'has expected data columns' 


    context 'data columns:' do
      let(:user_data) { output[:data].first }

      it 'id' 


      it 'name' 


      it 'email' 


      it 'confirmed_at' 


      it 'attended' 


      it 'roles' 

    end
  end
end

