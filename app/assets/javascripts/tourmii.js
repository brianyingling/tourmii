$(function() {

// instantiate Router
var tourmiiRouter = new TourmiiRouter();

// needed for urls
Backbone.history.start();


// Initiate mainView once user logs in
var mainView = new MainView( {el:$('.container')} );
// mainView.render().$el;


});