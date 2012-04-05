module GnarusExercise
  class ExercisesController < ApplicationController
  
    before_filter :authenticate_user! if defined?(Devise)
  
    def index
      @exercises = Exercise.all.select{|e| e.author.id == current_user.id}
    end

    def show
      @exercise = Exercise.find(params[:id])
    end

    def new
      @exercise = Exercise.new
    end

    # GET /exercises/1/edit
    def edit
      @exercise = Exercise.find(params[:id])
    end

    def create
      @exercise = Exercise.new(params[:exercise])
      @exercise.author = current_user if defined?(Devise)

        if @exercise.save
          redirect_to @exercise, notice: 'Exercise was successfully created.'
        else
          render action: "new"
        end
    end

    def update
      @exercise = Exercise.find(params[:id])
      if defined?(Devise) && @exercise.author == current_user 
        params[:exercise].delete :author_id
        @exercise.update_attributes(params[:exercise])
      end

      redirect_to @exercise, notice: 'Exercise was successfully updated.'
    end

    # DELETE /exercises/1
    # DELETE /exercises/1.json
    def destroy
      @exercise = Exercise.find(params[:id])
      if defined?(Devise) && @exercise.author == current_user 
        @exercise.destroy
      end

      redirect_to exercises_url
    end
  end
end