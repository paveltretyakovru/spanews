if (typeof DEBUG === 'undefined') DEBUG = true;
var host = "";

requirejs.config({
    'baseUrl'   : '/spanews',
    'paths'     : {
        // CORE
        'requirejs'             : 'bower_components/requirejs/require'                                      ,
        'jquery'                : 'bower_components/jquery/dist/jquery.min'                                 ,
        'underscore'            : 'bower_components/underscore/underscore-min'                              ,
        'backbone'              : 'bower_components/backbone/backbone-min'                                  ,
        'backbone.babysitter'   : 'bower_components/backbone.babysitter/lib/backbone.babysitter.min'        ,
        'backbone.wreqr'        : 'bower_components/backbone.wreqr/lib/backbone.wreqr.min'                  ,
        'marionette'            : 'bower_components/backbone.marionette/lib/core/backbone.marionette.min'   ,
        
        // PATHS
        'app'           : host + 'js/app'           ,
        'views'         : host + 'js/app/views'     ,
        
        // PLUGINS
        'bootstrap'     : 'bower_components/bootstrap/dist/js/bootstrap.min',
        'pace'          : 'bower_components/pace/pace.min'                  ,
    },
    'shim': {
        'jquery' : {
            'exports': '$'
        } ,
        'underscore': {
            'exports': '_'
        } ,
        'backbone': {
            'exports': 'Backbone',
            'deps': ['jquery', 'underscore']
        } ,
        'marionette' : {
            'deps' : ['backbone' , 'jquery']
        },

        // PLUGINS
        'bootstrap': {
            'deps': ['jquery']
        } ,

        'pace': {
            'deps': ['jquery']
        }

    },
    config: {
        
    }
});
