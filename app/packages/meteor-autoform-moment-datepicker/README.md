gildaspk:autoform-moment-datepicker
=========================

This package is a copy of [aldeed:autoform-bs-datetimepicker](https://github.com/aldeed/meteor-autoform-bs-datetimepicker/)
modified to use [moment-datepicker](https://github.com/MakingSense/moment-datepicker) plugin.

An add-on Meteor package for [aldeed:autoform](https://github.com/aldeed/meteor-autoform). Provides a single custom input type, "moment-datepicker", which renders an input using the [moment-datepicker](https://github.com/MakingSense/moment-datepicker) plugin.

## Prerequisites

Bootstrap must be installed separately.

In a Meteor app directory, enter:

```bash
$ meteor add twbs:bootstrap
$ meteor add aldeed:autoform
```

## Installation

In a Meteor app directory, enter:

```bash
$ meteor add gildaspk:autoform-moment-datepicker
```

## Usage

Specify "moment-datepicker" for the `type` attribute of any input. This can be done in a number of ways:

In the schema, which will then work with a `quickForm` or `afQuickFields`:

```js
{
  date: {
    type: Date,
    autoform: {
      type: "moment-datepicker"
    }
  }
}
```

Or on the `afFieldInput` component or any component that passes along attributes to `afFieldInput`:

```js
{{> afQuickField name="typeTest" type="moment-datepicker"}}

{{> afFormGroup name="typeTest" type="moment-datepicker"}}

{{> afFieldInput name="typeTest" type="moment-datepicker"}}
```

## Automatic Type Conversions

This input type is intended to be used with `type: Date` schema keys, but it also works with other schema types. Here's a list:

* `Date`: Value is stored as a `Date` object representing the selected date and time in the timezone you specified with the `timezoneId` attribute. By default, the timezone is that of the browser (i.e., the user's computer time settings).
* `String`: Value is stored as a string representation of the selected date in ISO format, e.g., "2014-11-25T00:00:00".
* `Number`: Value is stored as the result of calling `getTime()` on the `Date` object (representing the selected date and time in the timezone you specified).
* `Array`: If the schema expects an array of `Date` or `String` or `Number`, the value is converted to a one-item array and stored.

To provide moment-datepicker options, set a `momentDatePickerOptions` attribute equal to a helper that returns the options object.

## i18n
As this uses moment, you simply have to include the localization files you want and initialize moment locale as specified in moment documentation.

There are several packages to include moment locale files:

* [gildaspk:moment-languages](https://atmospherejs.com/gildaspk/moment-languages) to includes all locale files
* [ryzmek packages](https://atmospherejs.com/?q=rzymek) to include specific locale files

## Customizing Appearance

If you want to customize the appearance of the input, for example to use an input group with date/time icons, use the [aldeed:template-extension](https://atmospherejs.com/aldeed/template-extension) package to replace the "afMomentDatePicker" template, like this:

```html
<template name="dpReplacement">
  <div class='input-group date'>
    <input type="text" value="" {{atts}}/>
    <span class="input-group-addon">
      <span class="glyphicon glyphicon-calendar"></span>
    </span>
  </div>
</template>
```

```js
Template.dpReplacement.replaces("afMomentDatePicker");
```

## Demo

[Live](http://autoform.meteor.com/types)

## Contributing

Anyone is welcome to contribute. Fork, make your changes, and then submit a pull request.

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.1.3/dist/gratipay.png)](https://gratipay.com/djhi/)
