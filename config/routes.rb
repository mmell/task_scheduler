TaskScheduler::Engine.routes.draw do

  root :to => 'scheduled_tasks#index'

  resources :scheduled_tasks

  # move a legacy route
  get "/task_scheduler" => redirect("/scheduled_tasks")

end
