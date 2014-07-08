Template.home.helpers

  objectives: ->
    Objectives.find({}, {sort: {createdAt: -1}})