var Manager = {};

Manager.Utilities = {

	Search: {
		addAutocompletion: function() {
			new Ajax.Autocompleter("game_query", "game_choices", "/search/quick_search", {
				updateElement: function(elem) {
					$('search-results').setStyle({display: 'none'});
					new Ajax.Updater('search-results', "/games/show/" + elem.title);
					$('search-results').toggle();
				}
			});
			
		}
	}

	
};