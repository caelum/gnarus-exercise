module GnarusExercise
  class ExercisesController < ApplicationController
  
    before_filter :authenticate_user! if defined?(Devise)
  
    def index
      @exercises = Exercise.all.select{|e| e.author.id == current_user.id}
    end

    # GET /exercises/1
    # GET /exercises/1.json
    def show
      @exercise = Exercise.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @exercise }
      end
    end

    # GET /exercises/new
    # GET /exercises/new.json
    def new
      @exercise = Exercise.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @exercise }
      end
    end

    # GET /exercises/1/edit
    def edit
      @exercise = Exercise.find(params[:id])
    end

    # POST /exercises
    # POST /exercises.json
    def create
      @exercise = Exercise.new(params[:exercise])
      @exercise.author = current_user if defined?(Devise)

      respond_to do |format|
        if @exercise.save
          format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
          format.json { render json: @exercise, status: :created, location: @exercise }
        else
          format.html { render action: "new" }
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @exercise = Exercise.find(params[:id])
      if defined?(Devise) && @exercise.author == current_user 
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