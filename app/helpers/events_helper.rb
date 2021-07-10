module EventsHelper
  def event_status(event)
    (event.start_date..event.end_date).cover?(DateTime.current.to_date) ? 'Active' : 'Inactive'
  end
end
