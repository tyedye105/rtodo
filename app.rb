require("sinatra")
require("sinatra/reloader")
require("./lib/task")
also_reload("lib/**/*.rb")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/results") do
  description = params.fetch("description")
  task = Task.new(description)
  task.save()
  erb(:results)
end
