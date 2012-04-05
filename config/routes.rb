GnarusExercise::Engine.routes.draw do
  
  root :to => "exercises#index"

  resources :exercises do
    resources :attempts
  end
  
end
