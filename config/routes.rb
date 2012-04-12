GnarusExercise::Engine.routes.draw do
  
  root :to => "exercises#index"

  resources :exercises do
    resources :attempts do
      resources :executions
    end
  end
  
  match "/ping" => "status#ping"
  
end
