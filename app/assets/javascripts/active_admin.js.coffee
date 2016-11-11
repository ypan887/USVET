#= require active_admin/base

jQuery ->
  $('#answer_next_question_id').parent().hide()
  $('#answer_value_input').hide()
  $('#answer_end_question, #answer_question_id').change ->
    endQuestion = $('#answer_end_question_input :selected').text()
    if endQuestion == "Yes"
      $('#answer_value_input').show()
    else
      selectedQuestion = $('#answer_question_id :selected').val()
      questions = $('#answer_question_id').html()
      options = $(questions).not("option[value='#{selectedQuestion}']")
      $('#answer_next_question_id').html(options)
      $('#answer_next_question_id').parent().show()
