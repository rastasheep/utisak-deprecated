$(document).ready(function() {
  // Modals
  $("a[rel*=leanModal]").leanModal({top: 50,closeButton: ".modal--close"});

  // Tooltips
  $('.tooltip').tooltipster();


  // Bind share button
  $('.item--content--share').click(function(event){
    event.preventDefault();

    $(this).parents(".list--item, .list--item--open").find(".item--share").slideToggle("100");
    $(this).parents(".list--item, .list--item--open").toggleClass('list--item list--item--open');
    $(this).find('i').toggleClass('icon-share icon-collapse');
  });

  // Bind reply button
  $('.comment--reply a').click(function(event){
    event.preventDefault();

    $(this).parents(".comment--reply").siblings(".comment--reply-form").slideToggle("200");
    ($(this).text() === "Zatvori") ? $(this).text("Odgovori") : $(this).text("Zatvori");

  });

  // Fency background for user profiles
  $.adaptiveBackground.run({
    changeTxtColor: true,
    parentTxtLight: "#fff",
    parentTxtDark: "#676767"
  });

});
