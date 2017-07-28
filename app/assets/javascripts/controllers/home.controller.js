;(function() {
  'use strict';
  
  angular.module('financeGeek')
    .controller('HomeController', HomeController);

  HomeController.$inject = ['$http'];

  function HomeController($http) {
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
        updateChart(vm.chart, response.data);
      });
    }

    vm.chart = createChart();
    vm.getCurrencies();
  }


  function updateChart(chart, data) {
    chart.data.labels = data.labels;
    chart.data.datasets[0].label = data.datasets.label;
    chart.data.datasets[0].data = data.datasets.data;

    chart.update();
  }

  function createChart() {
    var ctx = document.getElementById("myChart").getContext('2d');
    return new Chart(ctx, {
      type: 'line',
      data: {
        labels: [],
        datasets: [{
            fill: false,
            label: 'aa',
            data: [],
            backgroundColor: 'rgba(110, 43, 119, 0.2)',
            borderColor: 'rgba(110, 43, 119,1)',
            borderWidth: 1
        }]
      },
      options: {
        maintainAspectRatio: true,
        scales: {
          yAxes: [{
            scaleLabel: {
              display: true,
              labelString: 'Reais'
            },
            ticks: {
              beginAtZero:false,
              callback: function(value, index, values) {
                  return 'R$ ' + Number(value).toFixed(2);
              }
            }
          }],
          xAxes: [{
            scaleLabel: {
              display: true,
              labelString: 'Data/Hora'
            }
          }]
        }
      }
    });
  }

})();
