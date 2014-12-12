angular.module("widgets",[])
angular.module('dash', ['ngRoute', 'firebase', 'ngNumeraljs', 'widgets'])
  .value("fbURL", "https://scorching-inferno-3070.firebaseio.com/").factory("Data", ($firebase, fbURL) ->
    $firebase(new Firebase(fbURL)).$asObject())

.run(['$http', '$rootScope', '$window', '$location', 'Data', (($http, $rootScope, $window, $location, Data)->
  $rootScope.text = "heisann h1"
  $rootScope.data = Data
  )])

#.config('root')->
#  console.log "hello config"

