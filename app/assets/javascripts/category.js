$(document).on('turbolinks:load', function(){
  $(function(){

  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.category}</option>`;
    return html
  }

  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class="QuestionCategory__category ChoiceBox children-wrapper">
                        <select class="ChoiceBox__input" id="child-category" name="child_id">
                         <option value>---</option>
                          ${insertHTML}
                        </select>
                      </div>`
    $('.QuestionCategory').append(childSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="ChoiceBox grandchildren-wrapper">
                              <select class="ChoiceBox__input" id="grandchild-category" name="grandchild_id">
                                ${insertHTML}
                              </select>
                            </div>`
    $('.QuestionCategory').append(grandchildSelectHtml);
  }

  $('.ChoiceBox__input').on('change', function(){
    var parentCategory = $('.ChoiceBox__input').val();
    console.log(parentCategory);
    if (parentCategory != 1){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'        
      })
      .done(function(children){
        $('.children-wrapper').remove();
        $('.grandchildren-wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました。')
      })
    }else{
      $('.children-wrapper').remove();
      $('.grandchildren-wrapper').remove();
    }
  });
  
  $('.QuestionCategory').on('change', '#child-category', function(){
    var childId = $('#child-category option:selected').data('category');
    if (childId){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if(grandchildren.length != 0){
          $('.grandchildren-wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML)
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました')
      })
    }else{
      $('.grandchildren-wrapper').remove();
    }
  });
});
})