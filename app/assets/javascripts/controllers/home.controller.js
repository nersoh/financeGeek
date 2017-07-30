;(function() {
  'use strict';
  
  angular.module('financeGeek')
    .controller('HomeController', HomeController);

  HomeController.$inject = ['ChartService', '$http'];

  function HomeController(ChartService, $http) {
    var vm = this;

    vm.currencyType = 'Bitcoin';
    vm.currencyPeriod = 'last_day';
    vm.currencies = [];
    vm.loading = false;

    vm.getCurrencies = function() {
      vm.loading = true;
      $http.get(
        '/currencies/' + vm.currencyType.toLowerCase(), 
        { params: { filter: vm.currencyPeriod }}
      )
      .then(function (response) {
        vm.currencies = response.data;
        ChartService.updateChart(vm.chart, response.data);
      })
      .finally(function () {
        vm.loading = false;
      });
    }

    vm.chart = ChartService.createChart({}, 'currencyChart');
    vm.getCurrencies();
  }
})();
