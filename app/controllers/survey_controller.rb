class SurveyController < ApplicationController
  def index
    initial_question
    @stack_size = @@question_stack.size
  end

  def show
    @content = current_answer(params[:id])
  end

  def create
    @new_question = update_question
    @stack_size = @@question_stack.size
    respond_to do |format|
      format.js
    end
  end

private
  def initial_question
    @question = Question.base_question.first
    @question ||= Question.includes(:answers).first
    @@question_stack = [@question]
  end

  def update_stack
    question = Question.where(id: params[:next_question]).includes(:answers).first
    @@question_stack << question
    question
  end

  def pop_stack
    @@question_stack.pop
    @@question_stack.last
  end

  def update_question
    if params[:next_question]
      update_stack
    else
      pop_stack
    end
  end

  def current_answer(id)
    Answer.where(id: id).pluck(:value).first
  end
end
