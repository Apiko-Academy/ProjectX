Template.PopupWindow.events({
  'click .popup-window-close-btn': function () {
    Template.instance().$('.popup-window').hide();
  }
});

Template.PopupWindow.helpers({
  defaultParams: function () {
    return _.extend({
      displayCloseBtn: true,
      closeBtnPosition: 'right'
    }, Template.currentData());
  }
});


Template.PopupToggle.events({
  'click >': function (e) {
    e.preventDefault();
    var conf = Template.currentData();
    var $popup = $('[data-popup-window=' + conf.id +']');
    if ($popup.size() === 0) {
      return;
    }
    var $toggle = $(e.target);
    var toggle = _.extend($toggle.position(), {
      width: $toggle.width(),
      height: $toggle.height()
    });
    var popup = {
      width: $popup.width(),
      height: $popup.height()
    };
    var pageWidth = $('body').width();
    if (conf.autoPosition && $popup.is(':hidden')) {
      $popup
        .css('left', function() {
          var left = toggle.left + toggle.width / 2.0 - popup.width / 2.0;
          if (left + popup.width > pageWidth) {
            left = pageWidth - popup.width;
          }
          if (left < 0) {
            left = 0;
          }
          return left + 'px';
        })
        .css('top', function() {
          //var top = toggle.top - popup.height;
          //if (top < 0) {
          //  top =  toggle.top + popup.height + toggle.height;
          //}
          //return top + 'px';
        });
    }
    $popup.toggle(conf.animationSpeed);
  }
});


Template.PopupToggle.onCreated(function () {
  this.data = _.extend({
    animationSpeed: 400,
    autoPosition: null
  }, this.data);
});