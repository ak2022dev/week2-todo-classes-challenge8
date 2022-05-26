To Do Class Design Recipe

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can keep track of my todos
I want a program to manage my list of todos

As a user
So that I can make note of progress as I go along
I want to be able to mark my todos as complete when they're done

As a user
So that I can keep see my progress
I want to see all of my completed todos

As a user
So that I can keep see what I still need to do 
I want to see all of my incomplete todos

As a user
So that I can move to a different project 
I want to mark all of my todos as complete


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end

class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

_Unit tests for Todo_ 
# 1
todo = Todo("Wash the car")
todo.task # => "Wash the car" 

# 2
todo = Todo("Wash the car")
todo.mark_done! 
todo.done? # => true 

# 3
todo = Todo("Wash the car")
todo.done? # => false

# 4
todo = Todo("")
todo.done? # => error  "Task is empty. Please describe the task"

_Unit tests for TodoList_
# 1
list = TodoList.new
list.complete => empty
list.incomplete => empty

# 2
list = TodoList.new
list.give_up! => error "No tasks in list"


_Integration tests_
# 1
list = TodoList.new
todo = Todo.new("First task")
list.add(todo)
list.complete => []
list.incomplete => [todo]


# 3
list = TodoList.new
todo_1 = Todo.new("First task")
todo_2 = Todo.new("Second task")
list.add(todo_1)
list.add(todo_2)
list.complete => []
list.incomplete => [todo_1, todo_2]


# 5
list = TodoList.new
todo = Todo.new("First task")
list.add(todo)
todo.mark_done!
list.complete => [todo]
list.incomplete => []


# 7
list = TodoList.new
todo_1 = Todo.new("First task")
todo_2 = Todo.new("Second task")
list.add(todo_1)
list.add(todo_2)
todo_1.mark_done!
list.complete => [todo_1]
list.incomplete => [todo_2]


# 9
list = TodoList.new
todo_1 = Todo.new("First task")
todo_2 = Todo.new("Second task")
list.add(todo_1)
list.add(todo_2)
list.give_up!
list.complete => [todo_1, todo_2]
list.incomplete => []



4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.