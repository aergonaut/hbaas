require_relative '../spec_helper'
require 'json'

describe "index route" do
  before do
    header "Accept", "application/json"
    get "/"
  end

  it "responds to json" do
    expect(last_response).to be_ok
  end

  describe "response body" do
    let(:json) { JSON.parse(last_response.body) }

    it "has status and methods keys" do
      expect(json.keys).to match_array(%w(status methods))
    end

    it "has a status of success" do
      expect(json["status"]).to eq("success")
    end

    it "returns the methods in an array" do
      expect(json["methods"]).to have(2).items
    end
  end
end
