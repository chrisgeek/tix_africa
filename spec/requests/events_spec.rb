 require 'rails_helper'

RSpec.describe '/events', type: :request do
  let!(:user) { create(:user) }
  let!(:valid_attributes) do
    attributes_for(:event, user_id: user.id)
  end

  before { sign_in user }

  let(:invalid_attributes) { {} }

  describe 'GET /index' do
    before { get '/events', params: { current_user: user } }
    it 'renders a successful response' do
      # Event.create! valid_attributes

      # get events_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event = Event.create! valid_attributes
      get event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_event_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      event = Event.create! valid_attributes
      get edit_event_url(event)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Event' do
        expect {
          post events_url, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it 'redirects to the created event' do
        post events_url, params: { event: valid_attributes }
        expect(response).to redirect_to(event_url(Event.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Event' do
        expect {
          post events_url, params: { event: invalid_attributes }
        }.to change(Event, :count).by(0)
      end

      it 'renders an unsuccessful response' do
        post events_url, params: { event: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        valid_attributes
      }

      it 'redirects to the event' do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: new_attributes }
        event.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response (i.e. to display the "edit" template)' do
        event = Event.create! valid_attributes
        patch event_url(event), params: { event: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested event' do
      event = Event.create! valid_attributes
      expect {
        delete event_url(event)
      }.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      event = Event.create! valid_attributes
      delete event_url(event)
      expect(response).to redirect_to(events_url)
    end
  end
end
