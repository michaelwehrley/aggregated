Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  waitOn: ->
    [ Meteor.subscribe "objectives"]

requireLogin = (pause) ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render "accessDenied"
    pause()

# Router.before requireLogin,
#   only: "objectiveNew"

Router.map ->
  @route "home", # objectivesIndex? - share template?
    path: "/"

  @route "objectivesIndex",
    path: "/objectives"
    # Synopsis of what I am trying to do: My goal is to aggregate the world's lessons and teaching resources with data to allow for the collaboration and development of resources that can teach anyone - adult or child, white or black, deaf, bline or even in prison.

    # RAILSCAST look - shows all objectives with the winner as the primary image and a link to objecctive show page

  @route "objectiveNew",
    # Only for me & authorized users
    path: "/objectives/new"

  @route "objectiveEdit",
    # Only for me & authorized users
    path: "/objectives/:_id/edit"
    data: ->
      Objectives.findOne(@params._id)

  @route "objectiveShow",
    path: "/objectives/:_id"
    data: ->
      Objectives.findOne(@params._id)
    # Shows list of embeds in RANDOM order BEFORE completion date
    # Shows all embeds that you can rank

    # Shows list of results AFTER completion date in order with data - how many people ordered each one as 1st, 2nd, last
    # formula that takes into account volume, but also order consitency

  @route "embeds",
    path: "/embeds/:_id"
    # Displays Embed, creator, objective and ranking data
    # Comments for each embed