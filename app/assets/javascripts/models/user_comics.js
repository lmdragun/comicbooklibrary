function UserComics() {
	this.fetchUserComics();
	console.log("in UserComics Model");
}

// UserComics.prototype = {
// 	fetchUserComics: function(){
// 		$.ajax({
// 			type: 'GET',
// 			dataType: 'json',
// 			url: "http://localhost:3000/comics"
// 		}).done(function(response){
// 			console.log(response);
// 		});
// 	}
// }
