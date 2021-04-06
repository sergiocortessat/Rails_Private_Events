module EventsHelper
  def attend_button(event)
    (button_to 'Attend', attend_event_path(event.id), method: :post, class: 'btn btn-dark') if user_signed_in?
  end
end
