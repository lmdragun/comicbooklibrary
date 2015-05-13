var OwnershipsView = function(ownershipsModel){
	// this.series = document.getElementById("comic-series-input").value;
	this.library = $("#comic-library");
	this.model = userComicsModel;
	console.log("OwnershipsView")
	this.fetchUserComics();
}

OwnershipsView.lookupComic = function() {
	console.log("lookupComic function");
	$("#user-show").addEventListener("load", fetchOwnerships());
	console.log("fetched comic!")
}


OwnershipsView.fetchUserComics =  function(){
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "http://localhost:3000/comics"
	}).done(function(response){
		console.log(response);
	});
}
