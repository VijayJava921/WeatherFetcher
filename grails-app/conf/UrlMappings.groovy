class UrlMappings {

     static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
               constraints {
                    // apply constraints here
               }
          }

        "/"(controller:'weather', action:'index')
        "/weather/get/$zip"(controller:'weather', action:'get')
        "500"(view:'/error')
     }
}
