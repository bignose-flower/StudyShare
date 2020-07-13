$(document).on('turbolinks:load', function() {
    function buildHTML(answer){
      let image = "";
      if (!answer.image){
          image = "/images/default.jpg"
      }else{
          image = answer.image
      }
      let html = `<div class="AnswerList">
                    <div class="AnswerList__answer">
                      ${answer.answer}
                      <div class="AnswerInfo">
                        <div class="AnswerInfo__time">1分前</div>
                        <div class="AnswerInfo__user"><img class="UserIcon__icon_style" src="${image}"></div>
                      </div>
                    </div>
                  </div>`
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
        $('.AnswerSend').prop("disabled", false);
        let html = buildHTML(answer);
        $('.AnswerLists__box').prepend(html);
      })
      .fail(function(){
        alert('空白のまま送信できません。');
      })
  });

  
  $("#resolved a").on('click', function(){
    if(window.confirm('一度「解決」にするとこれ以降解答を受付しません。本当に「解決」でよろしいですか？')){

    }else{
      return false;
    }
  });
});
