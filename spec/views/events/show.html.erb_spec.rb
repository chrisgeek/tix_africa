require 'rails_helper'

RSpec.describe "events/show", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @event = assign(:event, create(:event, user_id: user.id))
  end


  it 'renders attributes' do
    render
    expect(rendered).to match ERB::Util.h(@event.name)
    expect(rendered).to match ERB::Util.h(@event.description)
    expect(rendered).to match ERB::Util.h(@event.start_date)
    expect(rendered).to match ERB::Util.h(@event.end_date)
  end
end
