var Tour = Backbone.Model.extend({
    defaults: {
        name: String
      , user: Object
      , steps: Array
      , images: Array
    }


  , url: function() {
      return (this.isNew() ) ? '/tours/' : '/tours/' + this.get('id');
  }

  , initialize: function() {
      console.log('new tour...');
      this.on('change', this.update);
  }
  , getName: function() {
      return this.get('name');
  }

  , parse: function(response) {
      console.log('Tour() parse...');
      this.set({name:response.name});
      this.set({user: new User(response.user)});
      this.set({steps: new StepCollection( response.steps )});
      this.set({images: response.images});
  }
  , update: function() {
      this.save();
  }
});

