TaskScheduler::Engine.routes.draw do

  root :to => 'scheduled_tasks#index'

  resources :scheduled_tasks

  # move a legacy route
  match "/task_scheduler" => redirect("/scheduled_tasks")

end
