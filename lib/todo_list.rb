# File: lib/todo_list.rb
class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    fail ("Trying to add an invalid (nil) task!") if todo.nil?
    @list << todo
  end

  def incomplete
    # Returns all non-done todos
    @list.select { |todo| !todo.done? }
  end

  def complete
    # Returns all complete todos
    @list.select { |todo| todo.done? }
  end

  def give_up!
    # Marks all todos as complete
    fail( "Cannot give up with no incomplete tasks in list!") if incomplete.empty?
    @list.each { |todo| todo.mark_done! }
  end
end
