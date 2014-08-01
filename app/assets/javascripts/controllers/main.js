pathwayHomes.controller("MainCtlr", ["$scope", "$timeout", function($scope, $timeout) {
  $scope.alertMessage = "";

  $scope.alert = function(message, timeout) {
    $scope.alertMessage = message;
    $timeout(function() { $scope.alertMessage = ""; }, timeout);
  };
}]);
