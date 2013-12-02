jQuery ->
  $("#rooba").popover
    container: ".container"
    html: "true"
    placement: "bottom"
    content: "<div id='wororo'>weeeeeeeee</div>"
  $("a[rel~=popover], .has-popover").popover()


  # $("a[rel~=tooltip], .has-tooltip").tooltip()



  # TODO: após merge, fazer daqui pra baixo na estrutura de views/notifications.js.coffee
  # hasNotification = (navbar) ->
  #   navbar.hasClass("notification") || navbar.hasClass("success") || navbar.hasClass("error")

  # navbar = $('.navbar')

  # $(".dropdown-toggle[title='Notificações']").hover ->
  #   if hasNotification(navbar)
  #     navbar.find("#arrow_gray_top").addClass "notification_hover"
  # , ->
  #   if hasNotification(navbar)
  #     navbar.find("#arrow_gray_top").removeClass "notification_hover"

  # # TODO: após merge, contemplar o caso do dropdown já estar aberto e chegar/sair uma notificação
  # notification_ddown = $("#notification_ddown")
  # arrow = $(navbar.find("#arrow_gray_top"))

  # notification_ddown.on "show.bs.dropdown", ->
  #   if hasNotification(navbar)
  #     arrow.addClass "notification_focus"
  # notification_ddown.on "hide.bs.dropdown", ->
  #   arrow.removeClass "notification_focus" if arrow.hasClass "notification_focus"
