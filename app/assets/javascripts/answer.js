$(function(){
  function buildHTML(answer){
    let posttime = new Date(answer.created_at);
    let diff = new Date().getTime() - posttime.getTime();
    let image = "";
    console.log(answer.image);
    if (!answer.image){
        image = "/images/default.jpg"
    }else{
        image = answer.image
    }
    let html = `<div class="AnswerList">
                  <div class="AnswerList__answer">
                    ${answer.answer}
                    <div class="AnswerInfo">
                      <div class="AnswerInfo__time">${diff}分前</div>
                      <div class="AnswerInfo__user"><img class="UserIcon__icon_style" src="${image}"></div>
                    </div>
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
      $('.AnswerLists__sum').after(html);
    })
    .fail(function(){
      alert('送信に失敗しました。');
    })
  });
});
