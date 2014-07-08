@Objectives = new Meteor.Collection("objectives", {
  schema:
    createdAt:
      type: Date
      autoValue: ->
        if @isInsert
          new Date
        else if @isUpsert
          $setOnInsert: new Date
        else
          @unset()
      denyUpdate: true
      label: "Created At"
    creatorId:
      type: String
      autoValue: ->
        if @isInsert
          Meteor.userId()
        else if @isUpsert
          Meteor.userId()
        else
          @unset()
      denyUpdate: true
      label: "Creator Id"
    title:
      type: String
    updatedAt:
      type: Date
      autoValue: ->
        new Date() if @isUpdate
      denyInsert: true
      optional: true
})

Objectives.allow
  update: ownsDocument
  remove: ownsDocument

# Meteor.methods

#   createObjective: (attributes) ->
    
#     user = Meteor.user()
#     # ensure the user is logged in
#     throw new Meteor.Error(401, "You need to log in to create an objective") unless user

#     # ensure the objective has a title
#     throw new Meteor.Error(422, "Objectives need a title") unless (attributes.title)

#     Objectives.insert(attributes)