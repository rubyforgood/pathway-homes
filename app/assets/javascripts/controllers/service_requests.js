pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$http", "ServiceRequest", function($scope, $http, ServiceRequest) {
  $scope.request = {};
  $http.get('/request_types.json').success(function(data) {
    $scope.request_types = data;
    console.log(data);
  });

  $scope.save = function() {
    ServiceRequest.post($scope.request).
      success(function(data) {
      $scope.alert("Saved!", "success");
      console.log(data);
    }).
      error(function(data) {
      $scope.alert("Unable to save", "danger");
      console.log(data);
    });
  };
}]);
