Wings.defineHyper 'wingsInput',
  helpers:
    activeClass: -> if Template.instance().hasFocus.get() then 'active' else ''
    prefixClass: -> if @prefix then 'prefix' else ''
    expandClass: -> if Template.instance().hasFocus.get() or Template.instance().hasValue.get() then 'expand' else ''

  created: ->
    Template.instance().hasFocus = new ReactiveVar(false)
    Template.instance().hasValue = new ReactiveVar(false)

  rendered: ->
    if @data.value
      Template.instance().hasValue.set(true)
      if @data.type is 'number'
        @ui.$source.val(accounting.formatNumber(this.data.value))
      else
        @ui.$source.val(@data.value)

  events:
    "focus input": -> Template.instance().hasFocus.set(true)
    "blur input": -> Template.instance().hasFocus.set(false)
    "input input": (event, template) ->
      value = template.ui.$source.val()

      Template.instance().hasValue.set(value isnt "")
      if template.data.type is 'number'
        template.ui.$source.val(accounting.formatNumber(value))
        value = accounting.parse(value)

      template.ui.$wrapper.trigger 'mango-change', value


