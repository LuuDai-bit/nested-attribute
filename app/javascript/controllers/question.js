$(window).on('load', function () {
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
});
