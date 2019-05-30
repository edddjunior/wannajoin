module EventsHelper

  def event_counter
    Event.all.count
  end

end
