require 'rails_helper'



RSpec.describe EventsController, type: :controller do

  
  let(:valid_attributes) {
    skip(":title,:timings,:eventlocation,:categories,:cost,:sponser,:venue,:details")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET #show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, params: {id: event.to_param}, session: valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  


  describe "POST #create" do
      before(:each) do
            @title = "test"
            @eventlocation = "loc"
            @event = Event.create!(cost: "free", title: @title, eventlocation: @eventlocation)
        end
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes}, session: valid_session
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, params: {event: valid_attributes}, session: valid_session
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to the created event" do
        post :create, params: {event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        post :create, params: {event: invalid_attributes}, session: valid_session
        expect(assigns(:event)).to be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        post :create, params: {event: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

 

end
