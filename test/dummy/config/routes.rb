Rails.application.routes.draw do

  mount TaskScheduler::Engine => "/task_scheduler"
end
