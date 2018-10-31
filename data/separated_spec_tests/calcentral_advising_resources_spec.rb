describe AdvisingResources do
  let(:empl_id) { 123 }
  let(:mock_link) { 'here is your link' }
  let(:academic_statuses) do
    [
      {
        'studentCareer' => {
          'academicCareer' => {'code' => 'LAW', 'description' => 'Law'},
          'fromDate' => '2017-08-09'
        }
      },
      {
        'studentCareer' => {
          'academicCareer' => {'code' => 'UGRD', 'description' => 'Undergraduate'},
          'fromDate' => '2011-01-12'
        }
      },
      {
        'studentCareer' => {
          'academicCareer' => {'code' => 'GRAD', 'description' => 'Graduate'},
          'fromDate' => '2015-02-24'
        }
      },
    ]
  end

  before do
    allow(User::Identifiers).to receive(:lookup_campus_solutions_id).and_return empl_id
    allow_any_instance_of(MyAcademics::MyAcademicStatus).to receive(:get_feed).and_return({:feed=> { 'student'=> { 'academicStatuses'=> academic_statuses } } })
    allow(LinkFetcher).to receive(:fetch_link).and_return mock_link
  end

  describe '#empl_id' do
    subject { described_class.empl_id random_id }
    it 'returns the EMPLID' 

  end

  describe '#lookup_student_career' do
    subject { described_class.lookup_student_career random_id }
    it 'returns the career code' 

  end

  describe '#fetch_links' do
    subject { described_class.fetch_links link_config }

    context 'when link config is nil' do
      let(:link_config) { nil }
      it 'returns no links' 

    end
    context 'when link config is empty' do
      let(:link_config) { [] }
      it 'returns no links' 

    end
    context 'when link config contains invalid configurations' do
      let(:link_config) do
        [
          { status: 'bad' }
        ]
      end
      it 'returns no links' 

    end
    context 'when link config contains valid configurations' do
      let(:link_config) do
        [
          { feed_key: :myspace_hyper_portal, cs_link_key: 'MYSPACE_HYPER_PORTAL'},
          { feed_key: :backstreet_boys_viral_videos, cs_link_key: 'BACKSTREET_BOYS_VIRAL_VIDEOS'}
        ]
      end
      it 'returns links' 

    end
  end

  describe '#generic_links' do
    subject { described_class.generic_links }

    it 'uses the generic link config to fetch links and return them in a list' 

  end

  describe '#student_specific_links' do
    subject { described_class.student_specific_links user_id }

    context 'when no user id is provided' do
      let(:user_id) { nil }
      it 'returns an empty hash' 

    end
    context 'when user id is provided' do
      let(:user_id) { random_id }
      it 'uses the student-specific link config to fetch links and return them in a list' 

    end
  end
end

