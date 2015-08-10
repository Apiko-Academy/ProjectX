Template.CompanyProfileProjectsTabItem.events
  'click [data-action="remove-project"]': (e) ->
    e.preventDefault()
    project = Template.currentData().project
    company = Template.parentData().company
    Companies.update _id: company._id,
      $pull: projects: name: project.name
