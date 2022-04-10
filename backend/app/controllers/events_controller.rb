class EventsController < ApplicationController
  def index
    events = [
      {
        title: "event1",
        start_at: 1.days.ago,
        location: "here",
      },
      {
        title: "event2",
        start_at: 2.days.ago,
        location: "there",
      },
    ]

    render json: {
      events: events.map { |e| serialize(e) }
    }
  end

  private

  def serialize(event)
    {
      title: event[:title],
      startAt: event[:start_at].rfc3339,
      location: event[:location],
    }
  end
end
