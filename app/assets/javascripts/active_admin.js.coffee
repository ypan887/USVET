#= require active_admin/base

calculateSelection = -> 
  nextQuestion = $('#answer_selected_next').attr("value")
  selectedQuestion = $('#answer_question_id :selected').val()
  questions = $('#answer_question_id').html()
  endOption = $("<option></option>").val("").text("No next question");
  options = $(questions)
    .not("option[value='#{selectedQuestion}']")
  $('#answer_next_question_id').html(options).prepend(endOption)
  $('#answer_next_question_id').val(nextQuestion)
  toggleValue

toggleValue = ->
  nextQuestion = $('#answer_next_question_id :selected').val()
  if !nextQuestion
    $('#answer_value_input').show()
  else
    $('#answer_value_input').hide()

jQuery ->
  $( document ).ready($('#answer_value_input').hide())
  $('#answer_question_id').ready( calculateSelection() )
  $('#answer_question_id').change( calculateSelection )
  $('#answer_next_question_id').change( toggleValue )