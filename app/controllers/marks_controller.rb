class MarksController < ApplicationController

  # GET /marks
  # GET /marks.json
  def index
    @marks = Mark.all
  end

  # GET /marks/1
  # GET /marks/1.json
  def show
    @mark = Mark.find(params[:id])
  end

end
