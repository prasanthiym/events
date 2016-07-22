require 'open-uri'
class EventsController < ApplicationController

def index
  @events = Event.all 
  url = "https://www.trumba.com/calendars/arts-at-emory.rss"
     @doc = Nokogiri::HTML(open(url))
     
end

def show
  @event = Event.find(params[:id])
end

end