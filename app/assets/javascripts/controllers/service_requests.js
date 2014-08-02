pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$routeParams", "ServiceRequest", "RequestType", function($scope, $routeParams, ServiceRequest, RequestType) {
  //$scope.params = $routeParams;
  $scope.request = {};
  $scope.creator = {};
  $scope.request_types = [];

  RequestType.all().success(function(data) { 
    $scope.request_types = data 
  });
  
  $scope.save = function($event) {
    if ($scope.form.$invalid) {
      $scope.form.$setDirty();
      $event.preventDefault();
    } else {
    }

      

    //ServiceRequest.post($scope.request).
    //  success(function(data) {
    //  $scope.alert("Record saved!", "success");
    //}).
    //  error(function(data) {
    //  $scope.alert("Unable to save", "danger");
    //});
  };
}]);
