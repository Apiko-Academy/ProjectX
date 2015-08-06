Template.DocRemoveBtn.events
  'click .doc-remove-btn': (e) ->
    e.preventDefault()
    data = Template.currentData()
    data.collection.remove _id:data._id, (err) ->
      if (err)
        sAlert.error err.message
        Winston.error err.message