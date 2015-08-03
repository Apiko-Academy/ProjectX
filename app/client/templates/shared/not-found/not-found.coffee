Template.NotFound.onCreated () ->
  url = Iron.Location.get().path
  Winston.warn "Request to non-existin URL \"#{url}\""
