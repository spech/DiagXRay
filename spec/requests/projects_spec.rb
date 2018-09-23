# spec/requests/projects_spec.rb
require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  # initialize test data
  let!(:projects) { create_list(:project, 10) }
  let(:project_name) { projects.first.name }

  # Test suite for GET /projects
  describe 'GET /projects' do
    # make HTTP get request before each example
    before { get '/projects' }

    it 'returns projects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /projects/:name
  describe 'GET /projects/:name' do
    before { get "/projects/#{URI.encode(project_name)}" }

    context 'when the record exists' do
      it 'returns the project' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(project_name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:project_name) { Faker::Lorem.word }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  # Test suite for POST /projects
  describe 'POST /projects' do
    # valid payload
    let(:valid_attributes) { { name: 'LearnElm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/projects', params: valid_attributes }

      it 'creates a project' do
        expect(json['name']).to eq('LearnElm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/projects', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /projects/:name
  describe 'PUT /projects/:name' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/projects/#{URI.encode(project_name)}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /projects/:name
  describe 'DELETE /projects/:name' do
    before { delete "/projects/#{URI.encode(project_name)}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
