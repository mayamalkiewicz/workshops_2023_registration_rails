class TaskFilterService < ApplicationService
  
  def initialize(filter)
    @filter = filter
  end

  def call
    filter_tasks
  end

  private

  def filter_tasks
    case @filter
    when "past"
      @tasks = Task.past
    when "no_deadline"
      @tasks = Task.no_deadline
    else
      @tasks = Task.sort_by_nearest_deadline
    end
  end
end
