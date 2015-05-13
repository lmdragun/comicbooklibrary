function Comic() {
	// this.searchTerms = searchTerms;
}

Comic.prototype = {
	fetchComic: function(){
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: "http://localhost:3000/comics/lookup.json"
		}).done(function(response){
			console.log(response);
		});
	},
	listComic: function(){
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: "http://localhost:3000/comics"
		}).done(function(response){
			console.log(response);
			console.log("found comics in database");
		});
	}
}
