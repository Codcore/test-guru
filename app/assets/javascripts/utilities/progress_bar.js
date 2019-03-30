document.addEventListener('turbolinks:load', function () {
    var progress_bar = document.querySelector('.progress-bar')
    var question_number = progress_bar.dataset.questionId
    var questions_count = progress_bar.dataset.questionsCount
    var percentage      = (100/questions_count)*question_number

    progress_bar.classList.add('w-'+percentage)
    progress_bar.setAttribute('role', 'progressbar')
    progress_bar.setAttribute('aria-valuemin', '0')
    progress_bar.setAttribute('aria-valuenow', percentage)
    progress_bar.setAttribute('aria-valuemax', '100')
    progress_bar.setAttribute('style', 'width: ' + percentage +'%')
    progress_bar.textContent = percentage + '%'
})
