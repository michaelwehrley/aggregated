Template.objectiveNew.helpers

Template.objectiveNew.events
  
  "submit form": (event, template) ->
    event.preventDefault()
    attributes = $("form").serializeObject()
    Meteor.call "createObjective", attributes, (error, id) ->
      if error
        throwError(error.reason)
      else
        Router.go "home"
    false