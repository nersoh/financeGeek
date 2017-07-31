;(function () {
  'use strict';

  angular.module('financeGeek')
         .factory('ChartService', ChartService);

  function ChartService() {
    function createChart(data, contextElementId) {
      var data = parseData(data);
      var ctx = document.getElementById(contextElementId).getContext('2d');

      return new Chart(ctx, {
        rawData: {},
        type: 'line',
        data: {
          labels: [],
          datasets: [{
              fill: false,
              label: '',
              data: [],
              backgroundColor: 'rgba(110, 43, 119, 0.2)',
              borderColor: 'rgba(110, 43, 119,1)',
              borderWidth: 1,
              pointRadius: 5
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
                beginAtZero: false,
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
          },
          tooltips: {
            callbacks: {
              label: function(tooltipItem, data) {
                return 'Cotação: R$ ' + tooltipItem.yLabel.toFixed(2);
              },
              footer: function(tooltipItems, data) {
                var tooltipItem = tooltipItems[0];
                return 'Variação: ' + 
                       this._chart.config.rawData.currencies[tooltipItem.index].variation +
                       '%';
              }
            }
          }
        }
      });
    }

    function updateChart(chart, data) {
      // For now created charts support only one dataset, which means
      // one data line per chart
      chart.config.rawData = data;
      var data = parseData(data);

      chart.data.labels = data.labels;
      chart.data.datasets[0].label = data.datasets.label;
      chart.data.datasets[0].data = data.datasets.data;

      chart.update();
    }

    function parseData(data) {
      return {
        labels: (data['currencies'] || []).map(function (currency) {
          return moment(currency.created_at).format('D/MM/Y HH:mm');
        }),
        datasets: {
          label: (data['meta'] ? data['meta']['label']: ''),
          data: (data['currencies'] || []).map(function (currency) {
            return currency.buy;
          })
        }
      }
    }

    return {
      createChart: createChart,
      updateChart: updateChart
    }
  }
})();