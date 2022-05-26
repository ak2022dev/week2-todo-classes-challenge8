require 'todo'
require 'todo_list'

RSpec.describe "integration" do
  it "adds first task into empty list as incomplete" do
    list = TodoList.new
    todo = Todo.new("First task")
    list.add(todo)
    expect(list.complete).to eq []
    expect(list.incomplete).to eq [todo]
  end
  it "adds a second task to a non-empty list" do
    list = TodoList.new
    todo_1 = Todo.new("First task")
    todo_2 = Todo.new("Second task")
    list.add(todo_1)
    list.add(todo_2)
    expect(list.complete).to eq []
    expect(list.incomplete).to eq [todo_1, todo_2]
  end
  it "registers a completed task as such when its been done" do
    list = TodoList.new
    todo = Todo.new("First task")
    list.add(todo)
    todo.mark_done!
    expect(list.complete).to eq [todo]
    expect(list.incomplete).to eq []
  end
  it "doesn't affect other incomplete tasks when a given task is completed" do
    list = TodoList.new
    todo_1 = Todo.new("First task")
    todo_2 = Todo.new("Second task")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done!
    expect(list.complete).to eq [todo_1]
    expect(list.incomplete).to eq [todo_2]
  end
  it "marks all tasks as complete if give-up" do
    list = TodoList.new
    todo_1 = Todo.new("First task")
    todo_2 = Todo.new("Second task")
    list.add(todo_1)
    list.add(todo_2)
    list.give_up!
    expect(list.complete).to eq [todo_1, todo_2]
    expect(list.incomplete).to eq []
  end
end
