var UserComicsView = function(userComicsModel){
	// this.series = document.getElementById("comic-series-input").value;
	this.library = $("#comic-library");
	this.model = userComicsModel;
	console.log("UserComicsView")
	this.lookupComic();
}

UserComicsView.prototype = {
  lookupComic: function() {
		console.log("lookupComic function");
		$("#user-show").addEventListener("load", fetchUserComics());
		console.log("fetched comic!")
  }

}
