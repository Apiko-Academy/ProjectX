Router.route '/access-forbidden',
  name: 'accessForbidden'


Router.goToAccessForbidden = () ->
  url = Iron.Location.get().path
  Winston.warn "Request to forbidden URL \"#{url}\""
  Router.go 'accessForbidden'
