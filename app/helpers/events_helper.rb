module EventsHelper

  def event_counter
    Event.all.count
  end

  def events_reverse
    @events.sort_by(created_at);reverse
  end

  def host
      @event.user.username
  end

  def user_options
    if signed_in?
      render partial: 'user_options' if current_user.username == host
    end
  end

end
