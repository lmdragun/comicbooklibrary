function Comic() {
	// this.searchTerms = searchTerms;
}

Comic.fetchComics =  function(series, creators){
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "http://localhost:3000/comics/index?series=" + series + "+" + "&creators=" + creators
	}).done(function(response){
		console.log(response);
	});
}
