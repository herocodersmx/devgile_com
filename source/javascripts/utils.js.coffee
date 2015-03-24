$(document).ready ->
  window.DevGile ||= {}

  $('#main-wrapper').fullpage(
    css3: true,
    scrollingSpeed: 700,
    paddingTop: '0',
    paddingBottom: '0',
    fixedElements: '#main-menu',
    sectionSelector: '.section',

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
      $('#main-menu a').on 'click', (event) =>
        event.preventDefault()
        element = event.currentTarget

        @evaluateLink(element)
        @changeMenuActiveTo(element)
        @trackEvent('click', $(element).attr('id'))

    setActiveMenu: ->
      section = $('.section.active').attr('id')
      element = $("#main-menu a[href='/#{section}']")
      @changeMenuActiveTo(element)

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
      page = $(element).data('page')
      history.pushState({}, '', "/#{section}")
      @pageGoTo(page)

    validateRoute: ->
      path = window.location.pathname
      element = $("#main-menu a[href='#{path}']")

      if element.length > 0
        page = $(element[0]).data('page')
        @pageGoTo page

    pageGoTo: (page)->
      $.fn.fullpage.moveTo(page)
      false

  window.utils = new DevGile.Utils()
