document.addEventListener('turbo:load', function () {
  const numberedNestedAnswer = () => {
    let num = 0
    let nestedAnswers = $(".nested-answers:visible").toArray()
    nestedAnswers.forEach((nestedAnswer) => {
      num++
      let answerLabel = $(nestedAnswer).find(".answer-label")[0]
      answerLabel.innerHTML = "Answer" + num
      createNewAnswer(num, nestedAnswer)
    })
  }

  const createNewAnswer = (num, nestedAnswer) => {
    let initValue = $(nestedAnswer).val()
    let html = `<p id="answer-${num}">${initValue}<p>`
    $('#survey-preview').append(html)

    let nestedAnswerDOM = $(nestedAnswer)[0]
    let eventNestedAnswer = $._data(nestedAnswerDOM, 'events')

    if (eventNestedAnswer && eventNestedAnswer.change) return

    $(nestedAnswer).on('change', (e) => {
      console.log('hhoho')
      let value = $(e.target).val()
      $(`#answer-${num}`).html(value)
    })
  }

  numberedNestedAnswer()

  $(".links").on("cocoon:after-insert", numberedNestedAnswer)
  $("#nested-answers-form").on("cocoon:after-remove", numberedNestedAnswer)

  // Handle question tag
  $('#question_tags_id').on('keypress', (e) => {
    if (e.keyCode != 13) return;

    e.preventDefault()

    $('#add_question_tag').trigger('click');
  })

  $('#add_question_tag_wrapper').on('cocoon:after-insert', (e, addedQuestionTag) => {
    let displayText = $(addedQuestionTag).children('.question-tag-display-text')
    let value = $(addedQuestionTag).children('.question-tag-value')
    let text = $('#question_tags_id').val()

    $(displayText).html(text)
    $(value).val(text)

    $('#question_tags_id').val('')
  })
});
