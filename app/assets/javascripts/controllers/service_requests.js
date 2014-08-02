pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$routeParams", "ServiceRequest", "RequestType", "User", function($scope, $routeParams, ServiceRequest, RequestType, User) {
  //$scope.params = $routeParams;
  $scope.request = {};
  $scope.creator = {};
  $scope.request_types = [];

  RequestType.all().success(function(data) { 
    $scope.request_types = data;
  });

  User.get($scope.creator.id).success(function(data) {
    $scope.creator = data;
  });

  $scope.isValid = function(name) {
    return $scope.form['service_request[' + name + ']'].$valid
  };
  
  $scope.save = function($event) {
    if ($scope.form.$invalid) {
      $scope.alert("Please complete the form first", "danger");
      $event.preventDefault();
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
