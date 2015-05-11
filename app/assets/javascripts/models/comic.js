function Comic(searchTerms) {
	this.searchTerms = searchTerms;
}

Comic.prototype = {
	fetchComic: function(){
			url: "/api/",
			dataType: "jsonp",
			context: this
		}).done(function(response){
			console.log(response.issue_number);
		})
	}
}
