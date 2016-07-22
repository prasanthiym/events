require 'rails_helper'


describe "Create Events" do

it "should create events" do
	request_headers = {
	        "Accept" => "application/json",
	        "Content-Type" => "application/json"
	      }
	      post "/create_events", {}, request_headers
	       parsed_response = JSON.parse(response.body)
	  expect(parsed_response["message"]).to eq('Events Created Successfully.')
      
end
end

