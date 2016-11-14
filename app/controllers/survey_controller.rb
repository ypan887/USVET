class SurveyController < ApplicationController
  def index
    initial_question
  end

  def show
    @content = current_answer(params[:id])
  end

  def create
    @new_question = Question.where(id: params[:next_question]).includes(:answers).first
    respond_to do |format|
      format.js
    end
  end

private
  def initial_question
    @question = Question.base_question.first
    @question ||= Question.includes(:answers).first
  end

  def current_answer(id)
    Answer.where(id: id).pluck(:value).first
  end
end
