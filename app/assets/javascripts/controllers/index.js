pathwayHomes.controller('IndexController', ['$scope', '$http', function ($scope, $http) {
  $http.get('service_requests.json').success(function(data) {
    $scope.requests = data;
    console.log(data);
  });

// pathwayHomes.controller('IndexController',['$scope', function($scope) {
//   $scope.requests = [
//   {
//     id: 1,
//     community_name: 'Americana Centre',
//     client_name: 'Britney Wright',
//     client_phone: '520-250-8037',
//     client_email: 'blw06g@gmail.com',
//     apt_number: '301',
//     status: 'pending',
//     work_desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae aperiam quam, distinctio culpa tempora ab, iure laborum ea, iste doloremque itaque veniam, veritatis excepturi inventore quo debitis quaerat a ipsum.',
//     special_instructions: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, illo vero, molestias consequatur maiores laudantium repellat quia odit cumque beatae reprehenderit, nulla quos alias itaque deleniti soluta. Rerum, voluptate, totam.',
//     alarm: true,
//     community_street_address: '112 Monroe St.',
//     community_zip_code: '20850',
//     assigned_at: '2014-08-01 16:25:37 -0400',
//     closed_at: '2014-08-01 16:25:37 -0400',
//     created_at: '2014-08-01',
//     updated_at: '2014-08-01 16:25:37 -0400',
//     pet: false,
//     assigned_worker: "Jim"
//   },
//   {
//     id: 2,
//     community_name: 'Americana Centre',
//     client_name: 'Britney Wright',
//     client_phone: '520-250-8037',
//     client_email: 'blw06g@gmail.com',
//     apt_number: '301',
//     status: 'pending',
//     work_desc: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae aperiam quam, distinctio culpa tempora ab, iure laborum ea, iste doloremque itaque veniam, veritatis excepturi inventore quo debitis quaerat a ipsum.',
//     special_instructions: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, illo vero, molestias consequatur maiores laudantium repellat quia odit cumque beatae reprehenderit, nulla quos alias itaque deleniti soluta. Rerum, voluptate, totam.',
//     alarm: true,
//     community_street_address: '112 Monroe St.',
//     community_zip_code: '20850',
//     assigned_at: '2014-08-01 16:25:37 -0400',
//     closed_at: '2014-08-01 16:25:37 -0400',
//     created_at: '2014-08-01',
//     updated_at: '2014-08-01 16:25:37 -0400',
//     pet: false,
//     assigned_worker: "Joe"
//   }];
}]);