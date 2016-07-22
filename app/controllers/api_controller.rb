require 'open-uri'
class ApiController < ApplicationController
  protect_from_forgery with: :null_session

def create_events
     url = "https://www.trumba.com/calendars/smithsonian-events.xml"
     @doc = Nokogiri::HTML(open(url))
     
     @doc.xpath("//entry").each_with_index do |node,i|
       if i < 10
         @event = Event.new
         
         @event.title = node.xpath("title").text
         @event.timings = node.xpath("formatteddatetime").text
         @event.categories = node.xpath("categories").text
         @event.eventlocation = node.xpath("eventlocation").text
         @event.cost = node.xpath("cost").text
         @event.sponser = node.xpath("sponsor").text
         @event.venue = node.xpath("venue").text
         @event.details = node.xpath("notes").text
         
         @event.save
       end
     end
      render json: { message: 'Events Created Successfully.'}
    
end

def create_events_rss
     url = "https://www.trumba.com/calendars/arts-at-emory.rss"
     @doc = Nokogiri::HTML(open(url))
     
     @doc.xpath("//item").each_with_index do |node,i|
       if i < 10
         @event = Event.new
         
         @event.title = node.xpath("title").text
         @event.timings = node.xpath("formatteddatetime").text
         
         @event.categories = node.xpath("customfield[@name='Event Type']").text
         
         @event.eventlocation = node.xpath("location").text
         @event.cost = 'Free'
         @event.sponser = ''
         
         if node.xpath("description").text.split("Venue")[1].present?
           @event.venue = node.xpath("description").text.split("Venue")[1].split("Contact")[0]
         end
         
         @event.details = node.xpath("description")[0].text
         
         @event.save
       end
     end
     
      render json: { message: 'Events From Rss Feed Created Successfully.'}
    
end


end