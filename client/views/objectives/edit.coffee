Template.objectiveEdit.helpers

Template.objectiveEdit.events
  
  "submit form": (event, template) ->
    event.preventDefault()
    attributes = $("form").serializeObject()
    objectiveId = @_id
    Objectives.update objectiveId, { $set: attributes }, (error) ->
      if error
        throwError(error.reason)
      else
        Router.go "objectiveShow",
        _id: objectiveId
    false