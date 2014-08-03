pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$routeParams", "ServiceRequest", "RequestType", function($scope, $routeParams, ServiceRequest, RequestType) {
  //$scope.params = $routeParams;
  $scope.request = {};
  $scope.request_types = [];
  $scope.request.id = $('form').data('id');

  RequestType.all().success(function(data) { 
    $scope.request_types = data;
  });

  if ($scope.request.id) {
    ServiceRequest.get($scope.request.id).success(function(data) {
      $scope.request = data;
      $scope.request.type = _.findWhere($scope.request_types, {id: $scope.request.request_type_id});
      $scope.request.authorized_to_enter = $scope.request.authorized_to_enter.toString();
      $scope.request.pet = $scope.request.pet.toString();
      $scope.request.alarm = $scope.request.alarm.toString();
    });
  }

  $scope.isValid = function(name) {
    if (name === 'closed_on' || name === 'status'){
      if($scope.form["service_request[status]"].$modelValue == 'closed'){
        var isValid = $scope.form["service_request[closed_on]"].$modelValue
        $scope.form.$invalid = !isValid;
        // $scope.form['service_request[closed_on]'].$valid = isValid;    // doesn't matter but seems it should
        // $scope.form['service_request[closed_on]'].$invalid = !isValid; //ditto
      }
      else {
        $scope.form.$invalid = false; //hack!  what's better?
        // $scope.form['service_request[closed_on]'].$valid = true;     // doesn't matter but seems it should
        // $scope.form['service_request[closed_on]'].$invalid = false;  //ditto
      }
    }
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
