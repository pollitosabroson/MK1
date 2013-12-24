call_action = (valor) ->
  switch valor
    when "show"
      call_show()
call_show = ->
  $gauge = $(".div_gauge");	
  $(".btn-estrella").hover(
    (->
      $this = $(this);
      ancho = $this.outerWidth();
      raiting = $this.attr("raiting")
      gau_width = ancho * raiting;
      $gauge.width(gau_width);
    ),
    (->
      $gauge.width(0); 
    )
  )