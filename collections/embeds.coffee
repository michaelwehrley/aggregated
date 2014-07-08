@Embeds = new Meteor.Collection("embeds", {
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
    metaData:
      type: String
      optional: true      
    objectiveId:
      type: String
      optional: true
    updatedAt:
      type: Date
      autoValue: ->
        new Date() if @isUpdate
      denyInsert: true
      optional: true
})

Embeds.allow
  update: ownsDocument
  remove: ownsDocument