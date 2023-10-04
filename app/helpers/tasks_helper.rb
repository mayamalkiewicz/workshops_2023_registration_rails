module TasksHelper

  def deadline(task)
    task.deadline&.in_time_zone('Warsaw')&.strftime('%Y %B %d at %H:%M %P') || 'No deadline!'
  end
end