Turbolinks.enableProgressBar();


$(document).on("ajax:success", ".tasks", function(e){
  console.log(this);
  window.setTimeout(function(){window.location.reload()}, 1050);
  $(this).find('#singleTask').fadeOut(1000);
});




$(document).on("page:load", ".button", function(e){
  $(".close").on("click", function(e){
    console.log("this works")
  });
});
