$(function(){
  $(".radio-selector input:radio").addClass("input_hidden");
  $(".radio-selector label").click(function(){
      $(this).addClass('selected').siblings().removeClass('selected');
  });
  $(".radio-selector span.radio").remove();
});
