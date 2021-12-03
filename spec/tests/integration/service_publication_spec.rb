# frozen_string_literal: true

require_relative '../../helpers/spec_helper'
require_relative '../../helpers/vcr_helper'
require_relative '../../helpers/database_helper'

describe 'Search_Publication Service Integration Test' do
  VcrHelper.setup_vcr

  before do
    VcrHelper.configure_vcr
  end

  after do
    VcrHelper.eject_vcr
  end

  describe 'Retrieve and store project' do
    before do
      DatabaseHelper.wipe_database
    end

    it 'HAPPY: should be able to find and save remote paper to database' do
      # GIVEN: a valid url request for an existing remote project:
      publications = PaperDeep::PublicationMapper.new(API_TOKEN)
      publications.search(PID)
      publications_result = publications.parse

      search_request = { 'pid' => PID }

      # WHEN: the service is called with the request form object
      result = PaperDeep::Service::SearchPublication.new.call(search_request)

      # THEN: the result should report success..
      _(result.success?).must_equal true

      # ..and provide a project entity with the right details
      rebuilt = result.value!.message[:storage]
      _(rebuilt.size).must_equal(publications_result.size)

      _(rebuilt[0].pid).must_equal(publications_result[0].pid)
      _(rebuilt[0].journal_impact).must_equal(publications_result[0].journal_impact)
      _(rebuilt[0].views_count).must_equal(publications_result[0].views_count)
      _(rebuilt[0].citation_count).must_equal(publications_result[0].citation_count)
      _(rebuilt[0].publication_year).must_equal(publications_result[0].publication_year)
      _(rebuilt[0].source_title).must_equal(publications_result[0].source_title)
    end

    it 'HAPPY: should find and return existing paper in database' do
      # GIVEN: a valid url request for a project already in the database:
      search_request = { 'pid' => PID }
      db_publication = PaperDeep::Service::SearchPublication.new.call(search_request).value!.message[:storage]

      # WHEN: the service is called with the request form object
      result = PaperDeep::Service::SearchPublication.new.call(search_request)

      # THEN: the result should report success..
      _(result.success?).must_equal true

      # ..and find the same project that was already in the database
      rebuilt = result.value!.message[:publication]
      _(rebuilt.size).must_equal(db_publication.size)

      # ..and provide a project entity with the right details
      _(rebuilt[0].pid).must_equal(db_publication[0].pid)
      _(rebuilt[0].journal_impact).must_equal(db_publication[0].journal_impact)
      _(rebuilt[0].views_count).must_equal(db_publication[0].views_count)
      _(rebuilt[0].citation_count).must_equal(db_publication[0].citation_count)
      _(rebuilt[0].publication_year).must_equal(db_publication[0].publication_year)
      _(rebuilt[0].source_title).must_equal(db_publication[0].source_title)
    end

    it 'BAD: should gracefully fail for invalid pid' do
      # GIVEN: an invalid keyword request is formed
      bad_pid = ''
      search_request = { 'pid' => bad_pid }
      # WHEN: the service is called with the request form object
      result = PaperDeep::Service::SearchPublication.new.call(search_request)

      # THEN: the service should report failure with an error message
      _(result.success?).must_equal false
      _(result.failure.message).must_include 'trouble'
    end
  end
end
