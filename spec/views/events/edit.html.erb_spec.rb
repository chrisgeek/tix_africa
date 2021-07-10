require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    @event = assign(:event, create(:event, user_id: user.id))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do
    end
  end
end
