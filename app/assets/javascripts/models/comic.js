function Comic(searchTerms) {
	this.searchTerms = searchTerms;
}

Comic.prototype = {
	fetchComic: function(){
		$.ajax({
			url: "http://localhost:3000/comics/lookup.json"
		}).done(function(response){
			console.log(response);
		});
	}
}
