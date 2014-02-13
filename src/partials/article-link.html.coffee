article id: @document.id, class: "col-sm-6 separator", ->
  div class: "thumbnail thumb-hover", ->
    a href: @document.url, ->
      if @document.thumbnail?
        img src: "/img/placeholder.gif", 'data-original': @getThumbnail(@document.thumbnail[0], 'thumbnail'), class: "img-responsive lazy", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
        noscript ->
          img src: @getThumbnail(@document.thumbnail[0], 'thumbnail'), class: "img-responsive", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
      else
        img src: "/img/placeholder.gif", 'data-original': @getThumbnail("/img/placeholder.png", 'thumbnail'), class: "img-responsive lazy", alt: "No article image"
        noscript ->
          img src: @getThumbnail("/img/placeholder.png", 'thumbnail'), class: "lazy img-responsive", alt: "No article image"  
    header class: "caption", ->
      h3 ->
        a href: @document.url, ->
          text @document.title
      p ->
        i class: "glyphicon glyphicon-folder-open"
        for webCategory in @uniqueArray(@getCollection('categoryPages').toJSON())
          if webCategory.title?
            if @document.categories.indexOf(webCategory.title.toLowerCase()) isnt -1
              a href: webCategory.url, ->
                text webCategory.title
    footer ->
      div class: "text-center", ->
        button type: "button", class: "btn btn-sm btn-default", ->
          i class: "glyphicon glyphicon-calendar"
          time class: "updated", datetime: @document.computerDate, ->
            @document.humanDate
        div class: "btn-group", ->
          a class: "btn btn-sm btn-default", href: @document.url, ->
            i class: "glyphicon glyphicon-comment"
          a class: "btn btn-sm btn-default", href: @document.url+"#disqus_thread", ->
            text "-"
          button type: "button", class: "btn btn-sm btn-default dropdown-toggle", 'data-toggle': "dropdown", ->
            i class: "glyphicon glyphicon-retweet"
            text "Compartir"
          div class: "dropdown-menu dropdown-padded pull-right", ->
            a class: "sprite sprite-share sprite-share-facebook", href: "http://www.facebook.com/sharer.php?u=" + @getUrl(@document.url) + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
            a class: "sprite sprite-share sprite-share-twitter", href: "http://twitter.com/share?url=" + @getUrl(@document.url) + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
            a class: "sprite sprite-share sprite-share-google", href: "https://plus.google.com/share?url=" + @getUrl(@document.url), target: "_blank", title: "Compártelo en Google Plus"
            a class: "sprite sprite-share sprite-share-linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @getUrl(@document.url) + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
