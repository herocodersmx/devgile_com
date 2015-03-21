$(document).ready ->
  window.DevGile ||= {}

  sticky = new Waypoint.Sticky
    element: $('#main-menu')[0]

  $('#main-wrapper').fullpage(
    css3: true,
    scrollingSpeed: 700,
    paddingTop: '0',
    paddingBottom: '0',
    fixedElements: '.sticky-wrapper',
    sectionSelector: '.section'
  )

  class DevGile.Utils
    constructor: ->
      @bindEvents()
      setTimeout(=>
        @setVariables()
        @validateRoute()
      , 100)

    setVariables: ->
      @menuHeight  = $('#main-menu').innerHeight()
      @aboutTop    = $('#about_us').position().top - @menuHeight
      @clientsTop  = $('#clients').position().top - @menuHeight
      @techTop     = $('#technologies').position().top - @menuHeight
      @contactTop  = $('#contact_us').position().top - @menuHeight

    bindEvents: ->
      $(window).scroll =>
        @setActiveMenu()

      $('#main-menu a').on 'click', (event) =>
        event.preventDefault()
        element = event.currentTarget

        @evaluateLink(element)
        @changeMenuActiveTo(element)
        @trackEvent('click', $(element).attr('id'))

    setActiveMenu: ->
      scrollTop = $(window).scrollTop()

      if scrollTop >= @contactTop
        @changeMenuActiveTo('#main-menu #menu-contact_us')
      else if scrollTop >= @techTop
        @changeMenuActiveTo('#main-menu #menu-technologies')
      else if scrollTop >= @clientsTop
        @changeMenuActiveTo('#main-menu #menu-clients')
      else if scrollTop >= @aboutTop
        @changeMenuActiveTo('#main-menu #menu-about_us')
      else
        @cleanMenuActive()

    changeMenuActiveTo: (element) ->
      @cleanMenuActive()
      $(element).addClass('active')

    cleanMenuActive: ->
      $('#main-menu a.active').removeClass('active')

    trackEvent: (event_type, description)->
      ga('send', 'event', event_type, description)

    evaluateLink: (element)->
      #e.g. id = menu-about_us
      section = $(element).attr('href').replace('/', '')
      history.pushState({}, '', "/#{section}")
      @pageGoTo(section)

    validateRoute: ->
      path = window.location.pathname
      @pageGoTo path.replace('/', '')

    pageGoTo: (section)->
      if section is 'about_us'
        $(window).scrollTop(@aboutTop)
      else if section is 'clients'
        $(window).scrollTop(@clientsTop)
      else if section is 'technologies'
        $(window).scrollTop(@techTop)
      else if section is 'contact_us'
        $(window).scrollTop(@contactTop)

  window.utils = new DevGile.Utils()
