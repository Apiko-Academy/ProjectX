Template.atForm.onRendered () ->
  if @data.email
    @.$('#at-field-email').val(@data.email) if @.$('#at-field-email')
    @.$('#at-field-username_and_email').val(@data.email) if @.$('#at-field-username_and_email')