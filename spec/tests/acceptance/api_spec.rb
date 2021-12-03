# frozen_string_literal: true

require_relative '../../helpers/spec_helper'
require_relative '../../helpers/vcr_helper'
require_relative '../../helpers/database_helper'
require 'rack/test'

def app
  PaperDeep::App
end

describe 'Test API routes' do
  include Rack::Test::Methods

  VcrHelper.setup_vcr

  before do
    VcrHelper.configure_vcr
    # DatabaseHelper.wipe_database
  end

  after do
    VcrHelper.eject_vcr
  end

  describe 'Root route' do
    it 'should successfully return root information' do
      get '/'
      _(last_response.status).must_equal 200

      body = JSON.parse(last_response.body)
      _(body['status']).must_equal 'ok'
      _(body['message']).must_include 'api/v1'
    end
  end

  describe 'Search test' do
    it 'should successfully return scopus search information' do
      uri = '/api/v1/search'
      json = {"keyword": "blockchain"}.to_json
      post(uri, json, { 'CONTENT_TYPE' => 'application/json' })
      _(last_response.status).must_equal 201

      body = JSON.parse(last_response.body)
      _(body['keyword']).must_equal 'blockchain'
      _(body['paper'].length).must_equal 25
      _(body['links'].first['href']).must_equal '/api/v1/search'
    end
  end

  describe 'publication test' do
    it 'should successfully return publication search information' do
      uri = '/api/v1/publication'
      json = {"pid":'84979828304'}.to_json
      post(uri, json, { 'CONTENT_TYPE' => 'application/json' })
      _(last_response.status).must_equal 201

      body = JSON.parse(last_response.body)
      _(body['publication'].length).must_equal 1
      _(body['links'].first['href']).must_equal '/api/v1/publication'
    end
  end

  describe 'db/eid test' do
    it 'should successfully return publication search information' do
      uri = '/api/v1/db/eid'
      json = {"eid": "2-s2.0-84979828304"}.to_json
      post(uri, json, { 'CONTENT_TYPE' => 'application/json' })
      _(last_response.status).must_equal 200

      body = JSON.parse(last_response.body)
      _(body['eid']).must_equal '2-s2.0-84979828304'
      _(body['title']).must_equal 'Blockchains and Smart Contracts for the Internet of Things'
      _(body['citedby']).must_equal 1839
      _(body['publication_id']).must_equal '84979828304'
    end
  end
end