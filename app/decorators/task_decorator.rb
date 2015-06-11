class TaskDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime("%d %b %Y")
  end

  def due_at
    if overdue?
      h.content_tag(:div, "overdue", class: "label label-danger")
    else
      object.due_at.strftime("%d %b %Y")
    end
  end


  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
