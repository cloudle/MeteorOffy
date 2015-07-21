FlowLayout.setRoot('body') if Meteor.isClient

FlowRouter.route '/',
  action: (params) ->
    FlowLayout.render 'applicationLayout', {content: 'home', menu: 'menu', listing: 'listing'}

FlowRouter.route '/episode',
  action: (params) ->
    FlowLayout.render 'applicationLayout', {content: 'episode', menu: "menu", listing: 'listing'}

FlowRouter.route '/messenger',
  action: (params) ->
    FlowLayout.render 'applicationLayout', {content: 'messenger', menu: 'menu', listing: 'listing'}

