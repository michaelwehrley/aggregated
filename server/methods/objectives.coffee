Meteor.methods

  createObjective: (attributes) ->
    
    user = Meteor.user()
    # ensure the user is logged in
    throw new Meteor.Error(401, "You need to log in to create an objective") unless user
    attributes.creatorId = user._id

    # ensure the objective has a title
    throw new Meteor.Error(422, "Objectives need a title") unless (attributes.title)

    Objectives.insert(attributes)