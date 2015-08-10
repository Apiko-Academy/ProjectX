Template.CompanyProfileProjectsTab.helpers
  projectsInfo: () ->
    projectsList = Template.currentData().company.projects
    _.map projectsList, (project, index) ->
      index: index + 1
      project: project
      fieldName: "projects.#{index}.name"
      formId: "updateCompanyProjectName#{index}"
