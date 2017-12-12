require 'rails_helper'

describe "get all the destinations route", :type => :request do
  let!(:destinations) { FactoryBot.create_list(:destination, 10)}

  before { get '/destinations' }
  it 'returns all destinations' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end


describe "returns 404 not fournd", :type => :request do

  before { get '/destinations/3' }
  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end

describe "get a destinations route", :type => :request do
  let!(:destination) { @d = FactoryBot.create :destination }
  before { get "/destinations/#{@d.id}" }

  it 'returns a destinations' do
    expect(JSON.parse(response.body)['city']).to eq("Portland")
  end
end
