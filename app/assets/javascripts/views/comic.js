var ComicView = function(){
	// this.series = document.getElementById("comic-series-input").value;
	// this.series = $("#comic-series-input").val();
	console.log("YO")
	console.log("ComicView");
	// this.seriesForWeb = this.series.replace(/ /g, '+');
	// this.creator = document.getElementById("comic-creator-input").value;
	// this.creator = $("#comic-creator-input").val();
	console.log(this.creator);
	// this.creatorForWeb = this.creator.replace(/ /g, '+');
	// $('#update-comic').on('click', this.lookupComic.bind(this));
}

ComicView.lookupComics = function() {
  // var searchTerms = this.seriesForWeb + this.creatorForWeb;
	// console.log(searchTerms);
  // this.model = new Comic(searchTerms);
  // this.model.fetchComic();
	this.model.listComic();
  this.renderName();
	console.log("fetched comics!")
	console.log("listed comics!")
}

// listComics: function(){
// 	$.ajax({
// 		type: 'GET',
// 		dataType: 'json',
// 		url: "http://localhost:3000/comics"
// 	}).done(function(response){
// 		console.log(response);
// 		console.log("found comics in database");
// 	});
// }
