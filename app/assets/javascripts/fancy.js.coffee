jQuery ->
  $('a.fancybox').live 'hover', ->
    $(this).fancybox({ width: 853, height: 480 })
