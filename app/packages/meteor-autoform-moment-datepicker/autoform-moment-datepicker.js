AutoForm.addInputType("moment-datepicker", {
  template: "afMomentDatePicker",
  valueOut: function () {
    var m = this.datepicker('get');

    if (!m) {
      return m;
    }

    return m.toDate();
  },
  valueConverters: {
    "string": function (val) {
      return (val instanceof Date) ? val.toString() : val;
    },
    "stringArray": function (val) {
      if (val instanceof Date) {
        return [val.toString()];
      }
      return val;
    },
    "number": function (val) {
      return (val instanceof Date) ? val.getTime() : val;
    },
    "numberArray": function (val) {
      if (val instanceof Date) {
        return [val.getTime()];
      }
      return val;
    },
    "dateArray": function (val) {
      if (val instanceof Date) {
        return [val];
      }
      return val;
    }
  }
});

Template.afMomentDatePicker.helpers({
  atts: function addFormControlAtts() {
    var atts = _.clone(this.atts);
    // Add bootstrap class
    atts = AutoForm.Utility.addClass(atts, "form-control");
    delete atts.momentDatePickerOptions;
    return atts;
  }
});

Template.afMomentDatePicker.rendered = function () {
  var $input = this.$('input');
  var data = this.data;
  var opts = data.atts.momentDatePickerOptions || {};

  // To be able to properly detect a cleared field, the defaultDate,
  // which is "" by default, must be null instead. Otherwise we get
  // the current datetime when we call getDate() on an empty field.
  if (!opts.defaultDate || opts.defaultDate === "") {
    opts.defaultDate = null;
  }

  // instanciate datetimepicker
  $input.datepicker(opts);

  // set and reactively update values
  this.autorun(function () {
    var data = Template.currentData();
    var dtp = $input.datepicker('get');

    // set field value
    if (data.value instanceof Date) {
      $input.datepicker('set', data.value);
    } else {
      $input.datepicker('set', undefined); // clear
    }

    // set start date if there's a min in the schema
    if (data.min instanceof Date) {
      $input.datepicker('set', data.min);
    }

    // set end date if there's a max in the schema
    if (data.max instanceof Date) {
      $input.datepicker('set', data.max);
    }
  });

};
