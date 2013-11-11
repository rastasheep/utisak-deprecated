$(document).ready(function() {
  // Modals
  $("a[rel*=leanModal]").leanModal();

  // Tooltips
  $('.tooltip').tooltipster();


  // Bind share button
  $('.item--content--share').click(function(event){
    event.preventDefault();

    $(this).parents(".list--item, .list--item--open").find(".item--share").toggle();
    $(this).parents(".list--item, .list--item--open").toggleClass('list--item list--item--open');
    $(this).find('i').toggleClass('icon-share icon-collapse');
  });

});

