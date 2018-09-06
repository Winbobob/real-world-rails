require 'rails_helper'

RSpec.describe 'Parsing first hearing files' do
  let(:dcf) {
    CaseFileImporter.new(source).import
  }

  let(:source) {
    JSON.load(
      File.read(
        File.expand_path("../../fixtures/#{name}.json", __FILE__)))
  }

  let(:errors) {
    RecursiveValidator.new(dcf).errors
  }

  context 'first hearing 01' do
    let(:name) { 'first_hearing_01' }

    it 'identifies no errors' 

  end

  context 'first hearing 02' do
    let(:name) { 'first_hearing_02' }

    it 'identifies one error on case' 

  end

  context 'first hearing 03' do
    let(:name) { 'first_hearing_03' }

    it 'identifies three errors on first defendant' 

  end

  context 'first hearing 04' do
    let(:name) { 'first_hearing_04' }

    it 'identifies one error on first defendant' 

  end

  context 'first hearing 05' do
    let(:name) { 'first_hearing_05' }

    it 'complains that special_measures is present for GAP' 

  end

  context 'first hearing 06' do
    let(:name) { 'first_hearing_06' }

    it 'identifies that the mme_id provided in the MMEResponse does not match mme on the case' 

  end

  context 'first hearing 07' do
    let(:name) { 'first_hearing_07' }

    it 'identifies that MmeNotRecordedResponse is invalid when there is MME' 

  end

  context 'first hearing 08' do
    let(:name) { 'first_hearing_09' }

    it 'identifies no errors' 

  end

  context 'first hearing 09' do
    let(:name) { 'first_hearing_09' }

    it 'identifies no errors' 

  end

  context 'first hearing 10' do
    let(:name) { 'first_hearing_10' }

    it 'identifies missing youth fields' 

  end

  context 'first hearing 11' do
    let(:name) { 'first_hearing_11' }

    it 'identifies that madatory field brief description of the case is not present' 

  end

  context 'first hearing 12' do
    let(:name) { 'first_hearing_12' }

    it 'identifies no errors' 

  end

  context 'first hearing 13' do
    let(:name) { 'first_hearing_13' }

    it 'identifies the property ids referred to in the retail theft offences are not part of the case' 

  end
end

