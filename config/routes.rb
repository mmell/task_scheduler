ActionController::Routing::Routes.draw do |map|

  map.task_scheduler '/task_scheduler/:action/:id', :controller => 'task_scheduler'

end
