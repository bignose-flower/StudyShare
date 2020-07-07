$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(answer){
      let html = `<div class="AnswerList">
                    <div class="AnswerList__answer">
                      ${answer.answer}
                    </div>
                  </div>
                  <div class="CommentLists"></div>`
      return html;
    }

    $(".AnswerForm__form").on('submit', function(e){
      e.preventDefault();
      let url = $('.AnswerForm__form').attr('action');
      let formdata = new FormData(this);
      $.ajax({
        url: url,
        type: "post",
        data: formdata,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(answer){
        $('.AnswerForm__form')[0].reset();
        let html = buildHTML(answer);
        $('.AnswerLists').append(html);
      })
      .fail(function(){
        alert('送信に失敗しました。');
      })
    });
  });
});