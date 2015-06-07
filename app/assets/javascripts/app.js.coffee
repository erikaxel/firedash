angular.module("widgets",[])
angular.module("firedash-directives",[])
angular.module('dash', ['ngRoute', 'firebase', 'ngNumeraljs', 'widgets', 'firedash-directives', 'angularMoment'])
  .value("fbURL", "https://scorching-inferno-3070.firebaseio.com/")
  .constant "angularMomentConfig",
#    timezone: 'Europe/Amsterdam',
    format: 'YYYY-MM-DDTHH:mm:ss'

  .factory("Data", ['$firebaseObject', '$firebaseAuth', 'fbURL', ($firebaseObject, $firebaseAuth, fbURL) ->
    ref = new Firebase(fbURL)
    auth = $firebaseAuth(ref).$authWithPassword({email:firebase_email, password:firebase_password})
    $firebaseObject(ref)
])

angular.module('dash').run(['$http', '$rootScope', '$window', '$location', 'Data', (($http, $rootScope, $window, $location, Data)->
  $rootScope.text = "heisann h1"
  $rootScope.data = Data
  )])

#.config('root')->
#  console.log "hello config"

