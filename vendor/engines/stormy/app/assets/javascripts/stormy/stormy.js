;(function(window) {

  var Stormy = window.Stormy = {
    Templates: {},
    Models: {},
    Views: {},
    Collections: {}
  };

  Stormy.load = function() {
    compileHandlebars();

    Stormy.posts = new Stormy.Collections.Posts(Stormy.postData);

    new Stormy.Views.Index({ el: $("#posts-content"),
                             collection: Stormy.posts }).render();
  }


  function compileHandlebars() {
    $("script[type=handlebars]").each(function() {
      Stormy.Templates[this.id] = Handlebars.compile($(this).html());
    });
  }

  Stormy.Models.Post = Backbone.Model.extend({});

  Stormy.Collections.Posts = Backbone.Collection.extend({
    model:Stormy.Models.Post
  });

  Stormy.Views.Base = Backbone.View.extend({ 
    tmpl: function() {
      return Stormy.Templates[this.template].apply(this,arguments);
    },
    assign : function (view, selector) {
      view.setElement(this.$(selector)).render();
    }

  });


  Stormy.Views.Index = Stormy.Views.Base.extend({
    template: 'stormy-index',
    initialize: function() {

      this.postList = new Stormy.Views.Posts({ collection: this.collection });
    },

    render: function() {
      $(this.el).empty()
                .append(this.tmpl());

      this.assign(this.postList,"#post-list");
      return this;
    }
  });

  Stormy.Views.Posts = Stormy.Views.Base.extend({ 

    render: function() {
      $(this.el).empty();

      this.collection.each(function(model) {
        $(this.el).append(new Stormy.Views.Post({ model: model }).render().el);
      },this);
    }
  });

  Stormy.Views.Post = Stormy.Views.Base.extend({
    tagName: "li",
    template: "stormy-post",

    render: function() {
      $(this.el).empty()
                .append(this.tmpl(this.model.toJSON()));
      return this;
    }
  });

  


}(this));
