angular.module("widgets",[])
angular.module("firedash-directives",[])
angular.module('dash', ['ngRoute', 'firebase', 'ngNumeraljs', 'widgets', 'firedash-directives', 'angularMoment'])
  .constant "angularMomentConfig",
    timezone: 'Europe/Amsterdam',

  .factory("Data", ['$firebaseObject','$firebaseAuth', ($firebaseObject, $firebaseAuth) ->
    ref = firebase.database().ref()
    auth = $firebaseAuth().$signInWithEmailAndPassword(firebase_email, firebase_password)
    $firebaseObject(ref)
])

angular.module('dash').run(['$http', '$rootScope', '$window', '$location', 'Data', (($http, $rootScope, $window, $location, Data)->
  $rootScope.text = "heisann h1"
  $rootScope.data = Data
  )])

