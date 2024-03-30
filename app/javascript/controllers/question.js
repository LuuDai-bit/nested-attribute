document.addEventListener('DOMContentLoaded', function () {
  const numberedNestedAnswer = () => {
    let num = 0
    let nestedAnswers = $(".nested-answers:visible").toArray()
    nestedAnswers.forEach((nestedAnswer) => {
      num++
      let answerLabel = $(nestedAnswer).find(".answer-label")[0]
      answerLabel.innerHTML = "Answer" + num
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
