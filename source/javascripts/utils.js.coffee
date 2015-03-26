$(document).ready ->
  window.DevGile ||= {}

  $('#main-wrapper').fullpage(
    css3: true,
    scrollingSpeed: 700,
    paddingTop: '0',
    paddingBottom: '0',
    fixedElements: '#main-menu',
    sectionSelector: '.section',
    keyboardScrolling: true,

    onLeave: (index, nextIndex, direction) =>
      utils.setActiveMenu()
  )

  class DevGile.Utils
    constructor: ->
      @bindEvents()
      setTimeout(=>
        @validateRoute()
      , 100)

    bindEvents: ->
      $('#main-menu .link-page').on 'click', (event) =>
        event.preventDefault()
        element = event.currentTarget

        @evaluateLink(element)
        @changeMenuActiveTo(element)
        @trackEvent('click', $(element).attr('id'))

    setActiveMenu: ->
      section = $('.section.active').attr('id')
      path = if section is 'header' then '/' else "/#{section}/"
      element = $("#main-menu a[href='/#{section}/']")

      @changeUrlTo(path)
      @changeMenuActiveTo(element)
      @changeMenu(section)

    changeMenuActiveTo: (element) ->
      @cleanMenuActive()
      $(element).addClass('active')

    cleanMenuActive: ->
      $('#main-menu a.active').removeClass('active')

    trackEvent: (event_type, description)->
      ga('send', 'event', event_type, description)

    changeUrlTo: (path)->
      history.pushState({}, '', path)

    evaluateLink: (element)->
      #e.g. id = menu-about_us
      section = $(element).attr('href').replace('/', '')
      page = $(element).data('page')

      @changeUrlTo("/#{section}")
      @pageGoTo(page)

    validateRoute: ->
      path = window.location.pathname
      element = $("#main-menu a[href='#{path}']")

      if element.length > 0
        page = $(element[0]).data('page')
        @pageGoTo page

    pageGoTo: (page)->
      if page > 1
        $.fn.fullpage.moveTo(page)
      else
        $.fn.fullpage.moveTo(1)
      false

    changeMenu: (section) ->
      if section is 'header'
        $('#logo-container a').addClass('hidden')
      else if section isnt 'header'
        $('#logo-container a').removeClass('hidden')

  window.utils = new DevGile.Utils()
