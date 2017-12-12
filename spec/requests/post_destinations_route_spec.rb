require 'rails_helper'

describe "post a destination route", :type => :request do
  before do
    post '/destinations', params: JSON.parse(FactoryBot.create(:destination).to_json)
  end

  it 'returns the destination country' do
    expect(JSON.parse(response.body)['country']).to eq('USA')
  end

  it 'returns the destination name' do
    expect(JSON.parse(response.body)['name']).to eq('Marks Happy Ending Stay')
  end

  it 'returns the destination city' do
    expect(JSON.parse(response.body)['city']).to eq('Portland')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(201)
  end
end

describe "post a destination route", :type => :request do
  before do
    post '/destinations'
  end

  it 'returns a record invalid' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
