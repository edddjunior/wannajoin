module EventsHelper

  def event_counter
    Event.all.count
  end

  def events_reverse
    @events.sort_by(created_at);reverse
  end

end
