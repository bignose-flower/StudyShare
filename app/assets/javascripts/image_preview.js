$(document).on('turbolinks:load', function(){
  $(function(){
  
    function buildHTML(image){
      let html = `<img src="${image}", alt="preview" class="ImageInfo__image" id="Image_prev">`
  
      return html;
    }
  
    function readURL(input) {
      if (input.files && input.files[0]){
        let reader = new FileReader();
  
  
        reader.onload = function(e){
          let html = buildHTML(e.target.result);
          $('.ImageInfo').append(html);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
  
    $(".ImageInfo__upload").on('change', function(){
      $('.ImageInfo__image').remove();
      readURL(this);
      
    });
  })
})
