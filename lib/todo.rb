# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    fail ("Cannot enter empty task into list!") if task == ""
    
    @task = task
    @done = false
  end

  def task
    # Returns the task as a string
    @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @done
  end
end
