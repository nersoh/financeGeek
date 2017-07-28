;(function() {
  'use strict';
  
  angular.module('financeGeek')
    .controller('HomeController', HomeController);

  HomeController.$inject = ['ChartService', '$http'];

  function HomeController(ChartService, $http) {
    var vm = this;

    vm.currencyType = 'Dollar';
    vm.currencyFilter = 'last_day';
    vm.currencies = [];

    vm.getCurrencies = function() {
      $http.get(
        '/currencies/' + vm.currencyType.toLowerCase(), 
        { params: { filter: vm.currencyFilter }}
      )
      .then(function (response) {
        vm.currencies = response.data;
        ChartService.updateChart(vm.chart, response.data);
      });
    }

    vm.chart = ChartService.createChart({}, 'currencyChart');
    vm.getCurrencies();
  }

})();