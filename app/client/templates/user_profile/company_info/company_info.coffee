Template.CompanyInfo.events
  'click [data-action="remove"]': (e) ->
    e.preventDefault()
    Companies.remove _id: @_id, (err) ->
      if (err)
        sAlert.error err
        Winston.error err

Template.CompanyInfo.onRendered () ->
  @$('[data-toggle="tooltip"]').tooltip()
