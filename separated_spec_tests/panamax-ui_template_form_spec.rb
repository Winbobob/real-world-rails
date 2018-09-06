require 'spec_helper'

describe TemplateForm do

  let(:attributes) do
    {
      name: 'My template',
      description: 'generic wordpress installation',
      keywords: 'fast, simple, elegant',
      type: 'wordpress',
      repo: 'some/repo',
      app_id: 7,
      documentation: '##some markdown##'
    }
  end

  subject { described_class.new(attributes) }

  it { should respond_to :repo }
  it { should respond_to :repo= }
  it { should respond_to :name }
  it { should respond_to :name= }
  it { should respond_to :keywords }
  it { should respond_to :keywords= }
  it { should respond_to :author= }
  it { should respond_to :app_id }
  it { should respond_to :app_id= }
  it { should respond_to :app= }
  it { should respond_to :app }
  it { should respond_to :documentation }
  it { should respond_to :documentation= }

  describe '#app_id' do
    it 'is app_id if set' 


    it 'is the apps id when app_id is nil' 


    it 'returns nil if neither are set' 

  end

  describe '#documentation' do

    it 'returns documentation if set' 


    it 'returns the apps documentation otherwise' 


    it 'returns nil if neither are set' 


    context 'when the documentation contains carriage returns' do

      before do
        subject.documentation = "line1\r\nline2"
      end

      it 'strips the carriages returns out' 


    end

    context 'when the documentation cointains whitespace preceding a newline' do

      before do
        subject.documentation = "line1  \n\nline2 \r\nline3"
      end

      it 'strips out the non-newline whitespace' 

    end
  end

  describe '#author' do
    it 'defaults to the users email address' 


    it 'is author if both user.email and author are set' 


    it 'is nil if user has no email address' 

  end

  describe '#type' do
    let(:fake_types) { double(:types) }

    subject { described_class.new(attributes.merge(types: fake_types)) }

    before do
      allow(fake_types).to receive(:first).and_return(double(:type, name: 'Generic'))
    end

    it 'is the type if set' 


    it 'defaults to the value when type is falsey' 

  end

  describe '#save' do
    let(:fake_template) { double(:fake_template, valid?: true) }

    it 'creates a template' 


    context 'when template creation is successful' do
      let(:fake_template) { double(:fake_template, valid?: true) }

      before do
        allow(Template).to receive(:create).and_return(fake_template)
      end

      it 'saves the template to the supplied repo' 

    end

    context 'when template creation is not successful' do
      let(:errors) { double(:errors, messages: { name: ['is invalid'] }) }
      let(:fake_template) { double(:fake_template, errors: errors, valid?: false) }

      before do
        allow(Template).to receive(:create).and_return(fake_template)
      end

      it 'does not save the template to a repo' 


      it 'merges the template errors with the template form errors' 

    end

    context 'when token is unscoped for repo' do

      let(:fake_template) { double(:fake_template, valid?: true) }

      before do
        allow(Template).to receive(:create).and_return(fake_template)
        allow(subject).to receive(:save_template_to_repo).with(fake_template).and_raise('boom')
      end

      it 'adds an error for template form' 


      it 'display an error for the repo attribute' 


      it 'does not save the template to a repo' 


    end
  end

end

