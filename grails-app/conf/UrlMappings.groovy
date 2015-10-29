class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "/mobile"(view:"/mobile/index")
        // "/mobile/show/$id?"(controller: 'transaction', action: 'show') {
        //     // mobile = true
        // }
	}
}
