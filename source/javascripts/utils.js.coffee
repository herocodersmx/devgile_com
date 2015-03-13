$(document).ready ->
  sticky = new Waypoint.Sticky
    element: $('#main-menu')[0]

  window.DevGile ||= {}

  class DevGile.Utils
    constructor: ->
      @bindEvents()
      setTimeout(=>
        @setVariables()
      , 300)

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
        @changeMenuActiveTo event.currentTarget

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

  window.utils = new DevGile.Utils()
