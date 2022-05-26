require 'todo_list'

RSpec.describe TodoList do
  it "Initially has no complete and no incomplete tasks" do
    list = TodoList.new
    expect(list.complete).to eq []
    expect(list.incomplete).to eq []    
  end
  it "Raises an error if trying to add nil to the list" do
    list = TodoList.new
    expect {list.add(nil)}.to raise_error "Trying to add an invalid (nil) task!"    
  end
  it "Doesn't allow giving up if nothing in list" do
    list = TodoList.new
    expect{(list.give_up!)}.to raise_error "Cannot give up with no incomplete tasks in list!"    
  end
end
