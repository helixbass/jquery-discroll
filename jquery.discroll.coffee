(( $ ) ->
 $.discroll = D =
  events:
   left:
    "left"
   right:
    "right"
   up:
    "up"
   down:
    "down"
   leftEdge:
    "leftEdge"
   rightEdge:
    "rightEdge"
  options:
   bindSelector:
    "body"
   scrollableSelector:
    "#articles"
   articleSelector:
    "article"
   lateralSelector:
    ".column"
   verticalSelector:
    ".panel"
   activeClass:
    "active"
   lateralScrollOpts:
    axis:
     "x"
    duration:
     400
    easing:
     "easeOutQuint"

 $.fn.discroll =
  ( opts={} ) ->
   opts = $.extend {},
                   D.options,
                   opts
   $bind = $ opts.bindSelector
   $article = $ opts.articleSelector
   $scrollable = $ opts.scrollableSelector
   dirs = [ "left",
            "right",
            "up",
            "down" ]

   activate = ( $els, \
                i ) ->
    $els
     .removeClass( opts.activeClass )
     .eq( i )
     .addClass opts.activeClass

   scrollTo = ( $el ) ->
    $scrollable
     .scrollTo $el,
               opts.lateralScrollOpts

   dirHandler = ( dir ) ->
    edgeMethod =
     left:
      "first"
     right:
      "last"

    shift =
     left:
      -1
     right:
      1

    () ->
     $this = $ @
     $lateral = $this
                 .find opts.lateralSelector
     $activeLateral = $lateral
                       .filter( ".#{ opts.activeClass }" )
     if $activeLateral
         .is $lateral[ edgeMethod[ dir ]]()
       $this
        .triggerHandler D.events[ "#{ dir }Edge" ]
     else
       scrollTo activate $lateral,
                         $activeLateral
                          .index() + shift[ dir ]

   handlers =
    left:
     dirHandler "left"
    right:
     dirHandler "right"

   bindHandlers = () ->
    (( dir ) ->
      $bind
       .on D.events[ dir ],
           opts.articleSelector,
           handlers[ dir ] ) dir for dir in dirs
    null

   bindKeys = () ->
    (( dir ) ->
      $( document )
       .on "keydown",
           null,
           dir,
           ->
            $article
             .filter( ".#{ opts.activeClass }" )
             .trigger D.events[ dir ] ) dir for dir in dirs
    null

   bindKeys()
   bindHandlers()
   activate activate( $article,
                      0 )
             .find( opts.lateralSelector ),
            0
) jQuery
