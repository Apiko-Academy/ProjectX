Template.PopupToggle.events({
  'click >': function (e) {
    e.preventDefault();
    var id = Template.currentData().id;
    $('[data-popup-window=' + id +']').toggle();
  }
});
