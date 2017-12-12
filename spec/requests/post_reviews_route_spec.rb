require 'rails_helper'

describe "post a review route", :type => :request do
  before do
    d = FactoryBot.create(:destination)
    post "/destinations/#{d.id}/reviews", params: { :author => 'Keegan', :content => 'blah blah blah', :rating => 1 }
  end

  it 'returns the review author' do
    expect(JSON.parse(response.body)['author']).to eq('Keegan')
  end

  it 'returns the review content' do
    expect(JSON.parse(response.body)['content']).to eq('blah blah blah')
  end

  it 'returns the review rating' do
    expect(JSON.parse(response.body)['rating']).to eq(1)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(201)
  end
end
