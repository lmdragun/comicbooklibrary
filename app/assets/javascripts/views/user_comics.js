var UserComicsView = function(userComicsModel){
	// this.series = document.getElementById("comic-series-input").value;
	this.library = $("#comic-library");
	this.model = userComicsModel;
	console.log("UserComicsView")
	this.fetchUserComics();
}

UserComicsView.lookupComic = function() {
	console.log("lookupComic function");
	$("#user-show").addEventListener("load", fetchUserComics());
	console.log("fetched comic!")
}


UserComicsView.fetchUserComics =  function(){
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "http://localhost:3000/comics"
	}).done(function(response){
		console.log(response);
	});
}
