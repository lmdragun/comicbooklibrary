function Comic(title, creators) {
	this.title = title;
	this.creators = creators;
}

Comic.prototype = {
	fetchComic: function(){
		var api = "http://api.comicvine.com/search/?api_key=";
		var key = <%= ENV["comicvine_key"] %>;
		var search = "&limit=6&format=jsonp&json_callback=handleCallback&limit=20&offset=0&query=" + "/'" + title + "+" + creators + "/'";
		var full_url = api + key + search;
		return $.ajax({
			url: '/api/', "&resources=character&field_list=image,real_name,name,deck&json_callback=JSON_CALLBACK",
			dataType: "jsonp",
			context: this
		}).done(function(response){
			console.log(response.issue);
		})
	}
}

function Stock(symbol) {
  this.symbol = symbol;
  this.numShares = 0;
  // this.name = name;
  // this.lastPrice = lastPrice;
}

Stock.prototype = {
  fetchStock: function(){
    return $.ajax({
      url: "http://dev.markitondemand.com/api/v2/quote/jsonp?symbol=" + this.symbol,
      dataType: "jsonp",
      context: this
    }).done(function(response){
      this.name = response.Name;
      this.lastPrice = response.LastPrice;
      console.log(this.name);
      console.log(this.lastPrice);
    })
  },

  totalValue: function() { return lastPrice * this.numShares; }
}
